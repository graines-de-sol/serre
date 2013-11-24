  class Admin::GalleriesController < ApplicationController

  before_filter :is_admin, :load_conf

  def index
    @galleries = Gallery.all
    @gallery = Gallery.new
  end

  def show
    @gallery = Gallery.find(params[:id])
  end

  def create
    @galleries = Gallery.all
    @gallery = Gallery.create(params[:gallery])

    render :template => '/admin/galleries/index'
  end

  def update
    @gallery = Gallery.find(params[:id])
    @gallery.update_attributes(params[:gallery])

    render :template => '/admin/galleries/show'
  end

  def destroy
    Gallery.destroy(params[:id])

    redirect_to admin_galleries_path
  end

end

