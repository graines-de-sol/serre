class BlogController < ApplicationController

  before_filter :is_logged, :load_conf

  # GET /blog
  # Show last recent blog posts                            HTML
  # -----------------------------------------------------------
  def index
    @posts = Post.last_posts
  end

  # GET /blog/:id
  # Show a particular blog post                            HTML
  # -----------------------------------------------------------
  def show
    @post = Post.find(params[:id])
  end

  # POST /blog
  # Create/Update a blog post                          REDIRECT
  # -----------------------------------------------------------
  def create

    if params[:post_id]
      Post.find(params[:post_id]).update_attributes(params[:post])
      this_post_id = params[:post_id]
    else
      this_post = Post.create(params[:post])
      this_post_id = this_post.id
    end

    redirect_to  blog_path(this_post_id)
  end

  # PUT /blog/:id
  # Add a comment for this blog post                   REDIRECT
  # -----------------------------------------------------------
  def update

    Comment.create(
      :member_id => current_user.member.id,
      :post_id   => params[:id],
      :content   => params[:comment]
    )

    redirect_to blog_path(params[:id])
  end

  # DELETE /blog/:id
  # Delete a post                                      REDIRECT
  # -----------------------------------------------------------
  def destroy

    Post.find(params[:id]).delete

    redirect_to  '/'
  end

  # GET /blog/cateogry/:id
  # Show blog posts by category                            HTML
  # -----------------------------------------------------------
  def show_category

    @posts = Post.where(:blog_category_id => params[:id])

    render :template => '/blog/index'
  end

  # GET /blog/archives/:year/:month
  # Show blog posts by month                               HTML
  # -----------------------------------------------------------
  def show_archives
    @posts = Post.where(["YEAR(created_at) = ? AND MONTH(created_at) = ?", params[:year], params[:month]])

    render :template => '/blog/index'
  end
end

