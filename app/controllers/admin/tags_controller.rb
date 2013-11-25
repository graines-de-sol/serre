class Admin::TagsController < ApplicationController

  before_filter :is_admin, :load_conf

  def index
    @skills = ActsAsTaggableOn::Tagging.where('taggable_id IS NULL AND context = ?', 'skills')
    @status = ActsAsTaggableOn::Tagging.where('taggable_id IS NULL AND context = ?', 'status')
  end

  def create
    new_tag = ActsAsTaggableOn::Tag.create(:name => 'nouveau')
    new_tagging = ActsAsTaggableOn::Tagging.create(
      :tag_id => new_tag.id,
      :taggable_id => nil,
      :taggable_type => 'Member',
      :context => params[:tag_type]
    )

    redirect_to admin_tags_path
  end

  def update
    params[:tag].each do |id, name|
      this_tag = ActsAsTaggableOn::Tag.find(id)
      this_tag.update_attributes(:name => name)
    end

    redirect_to admin_tags_path
  end

  def destroy
    this_tag = ActsAsTaggableOn::Tagging.find(params[:id])

    ActsAsTaggableOn::Tag.find(this_tag.tag_id).destroy
    ActsAsTaggableOn::Tagging.delete_all(['tag_id = ?', this_tag.tag_id])

    redirect_to admin_tags_path
  end

end

