class DashboardController < ApplicationController

  before_filter :is_logged, :load_conf

  def index
    @last_posts = Post.last_posts(3).published
  end

  def create

    params[:ad][:member_id] = current_user.member.id

    if params[:id].strip.blank?
      new_ad = Ad.create(params[:ad])
    else
      ad = Ad.find(params[:id])
      ad.update_attributes(params[:ad])
    end

    redirect_to  '/'
  end

  def update

    @survey = Survey.find(params[:survey_id])

    @voters_count = @survey.voters.length
    @survey.voters.include?(current_user.member.id)? @already_voted = true : @already_voted = false

    if !@already_voted && params[:vote]
      Survey.vote(current_user.member.id, params[:vote])
      @voters_count += 1
    end

    @results = Survey.results(@survey)

    render :partial => '/dashboard/survey_response'
  end

  def destroy

    Ad.find(params[:id]).update_attributes(
      :end_at => Time.now
    )

    redirect_to  '/'
  end
end

