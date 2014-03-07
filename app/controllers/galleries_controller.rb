  class GalleriesController < ApplicationController

  before_filter :load_conf

  def index
    @galleries = Gallery.all
  end

  def show
    @gallery = Gallery.find(params[:id])
  end

end

