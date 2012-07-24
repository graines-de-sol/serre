class Admin::GalleriesController < ApplicationController

  before_filter :is_admin, :load_conf


  # POST /admin/headlines
  # Update headline                                        HTML
  # -----------------------------------------------------------
  def index
    @galleries = Gallery.all
  end

  # POST /admin/headlines
  # Update headline                                    REDIRECT
  # -----------------------------------------------------------
  def create
    Gallery.create(params[:gallery])

    redirect_to admin_galleries_path
  end

  # DELETE /admin/galleries/:id
  # Delete image from gallery                          REDIRECT
  # -----------------------------------------------------------
  def destroy
    Gallery.destroy(params[:id])

    redirect_to admin_galleries_path
  end

end

