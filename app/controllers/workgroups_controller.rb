class WorkgroupsController < ApplicationController

  before_filter :is_logged, :load_conf

  def index
    first_category = WorkgroupCategory.published

    if first_category.empty?
      first_category_id = MediaCategory.create(:name => 'Default category')
    else
      first_category_id = first_category.first.id
    end

    redirect_to workgroup_path(first_category_id)
  end

  def show
    @category = WorkgroupCategory.find(params[:id])
  end

  def create
    @category = WorkgroupCategory.find(params[:id])
  end

  def upload_media
    params[:media] = {}
    params[:media][:media_category_id] = params[:id]
    params[:media][:file] = params[:qqfile]
    Media.create(params[:media])

    render :json => {:success => true}
  end

  def delete_media
    media_category = Media.find(params[:id]).media_category_id
    Media.find(params[:id]).destroy

    redirect_to media_path(media_category)
  end
  
  def download
    file = Media.find(params[:id])

    send_file "#{Rails.root}/medias/#{file.id}/#{file.locator}",
      :type        => file.mime_type,
      :filename    => file.filename,
      :x_sendfile  => true,
      :disposition => 'attachment'
  end

end

