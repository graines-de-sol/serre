class Admin::SurveysController < ApplicationController

  before_filter :is_admin, :load_conf

  # GET /admin/surveys
  # Show surveys managment                                HTML
  # ----------------------------------------------------------
  def index
    @survey = Survey.where(['location_id = ? AND parent_id = 0', $conf.default_location_id]).order('created_at DESC').first
  end

  # GET /admin/show_results/:id
  # Show surveys results                                  AJAX
  # ----------------------------------------------------------
  def show_results
    @survey = Survey.find(params[:id])
    @members = Member.where(['members.id IN (?)', @survey.voters])

    render :layout=>false
  end

  # POST /admin/surveys
  # Create a new survey                                REDIRECT
  # -----------------------------------------------------------
  def create
    Survey.create(
      :question    => params[:question],
      :location_id => $conf.default_location_id,
      :parent_id   => 0,
      :voters      => Array.new
    )

    redirect_to admin_surveys_path
  end

  # PUT /admin/surveys/:id
  # Destroyp whole survey & answers                    REDIRECT
  # -----------------------------------------------------------
  def destroy
    Survey.destroy(params[:id])

    redirect_to admin_surveys_path
  end

  # PUT /admin/surveys/:id
  # Update a survey                                    REDIRECT
  # -----------------------------------------------------------
  def update
    Survey.update(params[:survey].keys, params[:survey].values)

    redirect_to admin_surveys_path
  end

  # POST /admin/surveys/:id/create_answer
  # Create a new answer for a given survey             REDIRECT
  # -----------------------------------------------------------
  def create_answer
    Survey.create(
      :parent_id   => params[:id],
      :location_id => $conf.default_location_id,
      :voters      => Array.new
    )

    redirect_to '/admin/surveys'
  end

  # DELETE /admin/surveys/:id/delete_answer
  # Delete given answer                               REDIRECT
  # ----------------------------------------------------------
  def delete_answer
    Survey.find(params[:id]).destroy

    redirect_to '/admin/surveys'
  end


end

