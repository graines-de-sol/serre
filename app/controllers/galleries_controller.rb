  class GalleriesController < ApplicationController

  before_filter :is_logged, :load_conf

  def index
    @galleries = Gallery.all.order('event_at DESC')
  end

  def show
    @gallery = Gallery.find(params[:id])
  end

end

