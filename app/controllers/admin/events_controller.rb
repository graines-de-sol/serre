class Admin::EventsController < ApplicationController

  before_filter :is_admin, :load_conf

  # PUT /events/:id
  # Update calendar attributes                         REDIRECT
  # -----------------------------------------------------------
  def update
    Calendar.find(params[:id]).update_attributes(params[:calendar])

    redirect_to events_path
  end

end

