class Admin::AdsController < ApplicationController

  before_filter :is_admin, :load_conf

  # POST /admin/ads
  # Create a category                                  REDIRECT
  # -----------------------------------------------------------
  def create
    Category.create

    redirect_to admin_ads_path
  end

  # PUT /admin/ads
  # Update all categories' names                       REDIRECT
  # -----------------------------------------------------------
  def update
    Category.update(params[:category].keys, params[:category].values)

    redirect_to admin_ads_path
  end

  # DELETE /admin/ads/:id
  # Delete a category                                  REDIRECT
  # -----------------------------------------------------------
  def destroy
    Category.find(params[:id]).destroy

    redirect_to admin_ads_path
  end

end

