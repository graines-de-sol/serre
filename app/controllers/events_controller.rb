class EventsController < ApplicationController

  before_filter :is_logged, :load_conf

  def index
    @calendar = Calendar.find(1)

    events = Event.all
    @events = Array.new

    events.each do |event|
      @events.push({
        :id => event.id,
        :title => event.title,
        :start_at => event.start_at,
        :end_at => event.end_at
      })
    end
  end

  def show
    @event = Event.find(params[:id])
    @participants = @event.members

    render :json => {
      :event => {
        :event_id => @event.id, 
        :start_at => I18n.l(@event.start_at, :format => :long), 
        :end_at   => I18n.l(@event.end_at, :format => :long), 
        :location   => @event.location, 
        :start_at_time   => "#{@event.start_at.strftime("%Hh%M")}", 
        :end_at_time   => "#{@event.end_at.strftime("%Hh%M")}", 
        :title    => @event.title,
        :description  => @event.description
      }, 
      :participants => @participants
    }.to_json
  end

  def create
    @event = Event.find(params[:event_id])
    if params[:do] == 'add'
      Participant.create(:member_id => current_user.member.id, :event_id => params[:event_id])

      message = I18n.t('calendar.confirmed')
    end

    if params[:do] == 'remove'
      Participant.where(:member_id => current_user.member.id, :event_id => params[:event_id]).first.destroy

      message = I18n.t('calendar.canceled')
    end    

    render :text => message
  end

end

