class Admin::MediasController < ApplicationController

  before_filter :is_admin, :load_conf

  # POST /admin/medias/create
  # Create a media category                            REDIRECT
  # -----------------------------------------------------------
  def create
    MediaCategory.create

    redirect_to admin_medias_path
  end

  # POST /admin/medias/update
  # Update all cateogries' attributes                  REDIRECT
  # -----------------------------------------------------------
  def update
    MediaCategory.update(params[:category].keys, params[:category].values)

    redirect_to admin_medias_path
  end

  # DELETE /admin/medias:id
  # Delete a category                                  REDIRECT
  # -----------------------------------------------------------
  def destroy
    MediaCategory.find(params[:id]).destroy

    redirect_to admin_medias_path
  end

  # POST /admin/medias/:id/upload
  # Update all cateogries' attributes                  REDIRECT
  # -----------------------------------------------------------
  def upload_media
    params[:media][:media_category_id] = params[:id]
    Media.create(params[:media])

    redirect_to media_path(params[:id])
  end

  # DELETE /admin/medias/media/:id
  # Update all cateogries' attributes                  REDIRECT
  # -----------------------------------------------------------
  def delete_media
    media_category = Media.find(params[:id]).media_category_id
    Media.find(params[:id]).destroy

    redirect_to media_path(media_category)
  end

end

