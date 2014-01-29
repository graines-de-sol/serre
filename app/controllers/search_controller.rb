class SearchController < ApplicationController

  before_filter :is_logged, :load_conf

  def create
    @members = Member.where(['first_name LIKE ? OR last_name LIKE ?', "%#{params[:pattern]}%", "%#{params[:pattern]}%"]).order('first_name ASC')
    @posts = Post.where(['title LIKE ?', "%#{params[:pattern]}%"]).order('created_at DESC')
    @events = Event.where(['title LIKE ? OR description LIKE ? AND start_at > ?', "%#{params[:pattern]}%", "%#{params[:pattern]}%", Time.now]).order('created_at DESC')
    @galleries = Gallery.where(['name LIKE ? OR comment LIKE ?', "%#{params[:pattern]}%", "%#{params[:pattern]}%"]).order('created_at DESC')
    @medias = Media.where(['name LIKE ? OR filename LIKE ?', "%#{params[:pattern]}%", "%#{params[:pattern]}%"]).order('created_at DESC')
  end


end

