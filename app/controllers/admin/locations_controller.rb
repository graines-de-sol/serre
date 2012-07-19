class Admin::LocationsController < ApplicationController

  before_filter :is_admin, :load_conf

  # POST /admin/locations/create
  # Create a locations                                 REDIRECT
  # -----------------------------------------------------------
  def create
    Location.create

    redirect_to admin_locations_path
  end

  # POST /admin/locations/update
  # Update all locations' attributes                   REDIRECT
  # -----------------------------------------------------------
  def update
    Location.update(params[:location].keys, params[:location].values)

    redirect_to admin_locations_path
  end

  # DELETE /admin/locations:id
  # Delete a location                                  REDIRECT
  # -----------------------------------------------------------
  def destroy
    Location.find(params[:id]).destroy

    redirect_to admin_locations_path
  end

  # PUT /admin/occupation
  # Set occupation rate for given location                AJAX
  # ----------------------------------------------------------
  def occupation
    Location.find(params[:location_id]).update_attributes(:occupation=>params[:rate].to_i)

    render :text=>'success'
  end
end

