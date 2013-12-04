class Admin::BlogController < ApplicationController

  before_filter :is_admin, :load_conf

  def index
    @posts = Post.order('created_at DESC').all
  end

  def new
    @post = Post.new()
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    new_post = Post.create(params[:post])

    redirect_to admin_blog_path(new_post.id)
  end

  def update
    @post = Post.find(params[:id])
    @post.update_attributes(params[:post])

    redirect_to admin_blog_index_path
  end

  def destroy
    Post.find(params[:id]).destroy

    redirect_to admin_blog_index_path
  end

end

