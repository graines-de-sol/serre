class AdsController < ApplicationController

  before_filter :is_logged, :load_conf

  # GET /ads
  # Show all ads                                                 HTML
  # -----------------------------------------------------------------
  def index
    @categories = Category.all
    @ads = Ad.all
  end

  # POST /ads
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

  # DELETE /ads/:id
  # Deselete an ad                                     REDIRECT
  # -----------------------------------------------------------
  def destroy

    Ad.find(params[:id]).update_attributes(
      :end_at => Time.now
    )

    redirect_to  '/'
  end
end

