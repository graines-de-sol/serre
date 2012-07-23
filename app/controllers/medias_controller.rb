class MediasController < ApplicationController

  before_filter :is_logged, :load_conf

  # GET /medias
  # Get first cateogry to look in                          HTML
  # -----------------------------------------------------------
  def index
    first_category = MediaCategory.published

    if first_category.empty?
      first_category_id = MediaCategory.create(:name => 'Default category')
    else
      first_category_id = first_category.first.id
    end

    redirect_to media_path(first_category_id)
  end

  # GET /medias/:id
  # Show all medias in this category                       HTML
  # -----------------------------------------------------------
  def show
    @category = MediaCategory.find(params[:id])
  end

  # POST /medias
  # Insert a new media in this category                    HTML
  # -----------------------------------------------------------
  def create
    @category = MediaCategory.find(params[:id])
  end

  # POST /medias
  # Insert a new media in this category                    HTML
  # -----------------------------------------------------------
  def download
    file = Media.find(params[:id])

    send_file "#{Rails.root}/medias/#{file.id}/#{file.locator}",
      :type        => file.mime_type,
      :filename    => file.filename,
      :x_sendfile  => true,
      :disposition => 'attachment'
  end


end

