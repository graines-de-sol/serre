class BlogController < ApplicationController

  before_filter :is_logged, :load_conf

  # POST /blog
  # Create/Update a blog post                          REDIRECT
  # -----------------------------------------------------------
  def create
    if params[:post_id]
      this_post = Post.find(params[:post_id]).update_attributes(params[:post])
    else
      this_post = Post.create(params[:post])
    end

    redirect_to  blog_path(this_post.id)
  end

  # GET /blog/:id
  # Show a particular blog post                            HTML
  # -----------------------------------------------------------
  def show
    @post = Post.find(params[:id])
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
end

