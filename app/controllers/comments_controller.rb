class CommentsController < ApplicationController

  before_filter :is_logged, :load_conf

  # DELETE /comment/:id
  # Deselete a comment                                 REDIRECT
  # -----------------------------------------------------------
  def destroy

    this_comment = Comment.find(params[:id])
    this_post = this_comment.post.id
    this_comment.destroy

    redirect_to  blog_path(this_post)
  end
end

