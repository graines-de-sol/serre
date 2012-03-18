class DashboardController < ApplicationController

  before_filter :is_logged, :load_conf

  # GET /
  # Show dashboard main root page                                HTML
  # -----------------------------------------------------------------
  def index
    @new_ones = User.order('created_at DESC').limit(6).includes(:member)

    @categories = Category.all

    @ads = Ad.where(['
      end_at > ?
      AND (
        location_id = 0
        OR location_id = ?
        OR member_id = ?
      )',
      Time.now, current_user.member.location_id, current_user.member.id
      ]).order('created_at DESC').includes(:member)

    @locations = Location.all

    @surveys = Survey.where(['location_id = ? AND parent_id = 0', $conf.default_location_id]).order('created_at DESC')
  end

  # POST /dashboard
  # Create/update adds                                 REDIRECT
  # -----------------------------------------------------------
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

  # PUT /dashboard/:id
  # Update then output survey stats                         XHR
  # -----------------------------------------------------------
  def update

    @survey = Survey.find(params[:survey_id])

    if !@survey.voters.include?(current_user.member.id) && params[:vote]
      Survey.vote(current_user.member.id, params[:vote])
    end

    @results = Survey.results(@survey)

    render :partial => '/dashboard/survey_response'
  end

end

