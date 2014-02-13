class BlogController < ApplicationController

  before_filter :is_logged, :load_conf

  # GET /blog
  # Show last recent blog posts                            HTML
  # -----------------------------------------------------------
  def index
    @posts = Post.published.order('published_at DESC')
  end

  # GET /blog/:id
  # Show a particular blog post                            HTML
  # -----------------------------------------------------------
  def show
    if params[:id] == 'last'
      @post = Post.published.order('published_at DESC').first
    else
      @post = Post.find(params[:id])
    end
  end

  # POST /blog
  # Create/Update a blog post                          REDIRECT
  # -----------------------------------------------------------
  def create
    params[:post][:published_at] = "#{params[:published_date]} #{params[:date][:hour]}:#{params[:date][:minute]}:00"

    if params[:post_id]
      Post.find(params[:post_id]).update_attributes(params[:post])
      this_post_id = params[:post_id]
    else
      this_post = Post.create(params[:post])
      this_post_id = this_post.id
    end

    redirect_to  blog_path(this_post_id)
  end

  # DELETE /blog/:id
  # Delete a post                                      REDIRECT
  # -----------------------------------------------------------
  def destroy

    Post.find(params[:id]).delete

    redirect_to  '/'
  end

  # GET /blog/category/:id
  # Show blog posts by category                            HTML
  # -----------------------------------------------------------
  def show_category
    @posts = Post.where(['blog_category_id = ?', params[:id]]).order('published_at DESC')
    #@posts = Post.by_category(params[:id])

    render :template => '/blog/index'
  end

  # GET /blog/archives/:year/:month
  # Show blog posts by month                               HTML
  # -----------------------------------------------------------
  def show_archives
    @posts = Post.by_month(params[:year], params[:month])

    render :template => '/blog/index'
  end
end

