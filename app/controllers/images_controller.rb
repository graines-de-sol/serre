class ImagesController < ApplicationController

  before_filter :is_logged, :load_conf
  layout 'popup'

  # GET /images
  # Show images to be intserted via tinyMCE                      HTML
  # -----------------------------------------------------------------
  def index
    @images = Image.order('created_at DESC').all
  end

  # POST /images
  # Upload a new image                                           HTML
  # -----------------------------------------------------------------
  def create

    Image.create(params[:image])

    redirect_to images_path
  end

  # DELETE /images/:id
  # Delete image                                                 HTML
  # -----------------------------------------------------------------
  def destroy
    Image.destroy(params[:id])

    redirect_to images_path
  end

end

