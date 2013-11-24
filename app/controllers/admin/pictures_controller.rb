  class Admin::PicturesController < ApplicationController

  before_filter :is_admin, :load_conf

  def create
    Picture.create(params[:picture])

    redirect_to admin_gallery_path(params[:gallery_id])
  end

  def update
    Picture.create(params[:picture])

    redirect_to admin_gallery_path(params[:gallery_id])
  end

  def destroy
    Picture.destroy(params[:id])

    redirect_to admin_gallery_path(params[:gallery_id])
  end

end

