class AdsController < ApplicationController

  before_filter :is_logged, :load_conf

  # GET /ads
  # Show all ads                                                 HTML
  # -----------------------------------------------------------------
  def index
    @categories = Category.all
    @ads = Ad.published
  end

  # POST /ads
  # Create/update adds                                 REDIRECT
  # -----------------------------------------------------------
  def create

    params[:ad][:member_id] = current_user.member.id

    if params[:ad_id].strip.blank?
      new_ad = Ad.create(params[:ad])
    else
      ad = Ad.find(params[:ad_id])
      ad.update_attributes(params[:ad])
    end

    redirect_to  ads_path
  end

  # DELETE /ads/:id
  # Deselete an ad                                     REDIRECT
  # -----------------------------------------------------------
  def destroy

    Ad.find(params[:id]).update_attributes(
      :end_at => Time.now - 1.day
    )

    redirect_to  ads_path
  end
end

