class CommentsController < ApplicationController

  before_filter :is_logged, :load_conf
  include ERB::Util

  # UPDATE /comment/:id
  # Add a comment                                          AJAX
  # -----------------------------------------------------------
  def update

    this_comment = Comment.create(:content => params[:comment], :post_id => params[:id], :member_id => current_user.member.id)

    this_response = {:date => "Le #{l(this_comment.created_at, :format => :long)}", :comment => CGI::escapeHTML(this_comment.content).gsub(/\n/, '<br />')}
    
    render :json => this_response.to_json
  end

  # DELETE /comment/:id
  # Delete a comment                                 REDIRECT
  # -----------------------------------------------------------
  def destroy

    this_comment = Comment.find(params[:id])
    this_post = this_comment.post.id
    this_comment.destroy

    redirect_to  blog_path(this_post)
  end
end

