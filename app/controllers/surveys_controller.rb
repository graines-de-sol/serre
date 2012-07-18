class SurveysController < ApplicationController

  before_filter :is_logged, :load_conf

  # PUT /surveys/:id
  # Update then output survey stats                         XHR
  # -----------------------------------------------------------
  def create

    @survey = Survey.find(params[:id])

    @voters_count = @survey.voters.length
    @survey.voters.include?(current_user.member.id)? @already_voted = true : @already_voted = false

    if !@already_voted && params[:vote]
      Survey.vote(current_user.member.id, params[:vote])
      @voters_count += 1
    end

    @results = Survey.results(@survey)

    render :partial => '/modals/survey_response'
  end

end

