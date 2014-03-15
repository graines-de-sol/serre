class CommentsController < ApplicationController

  before_filter :is_logged, :load_conf
  include ERB::Util

  def create
    this_comment = Comment.create(:content => params[:comment], :post_id => params[:post_id], :member_id => current_user.member.id)

    this_response = {:date => "Le #{l(this_comment.created_at, :format => :long)}", :comment => CGI::escapeHTML(this_comment.content).gsub(/\n/, '<br />')}
    
    render :json => this_response.to_json
  end

  def update
    comment = Comment.find(params[:id])
    comment.update_attributes(:content => params[:comment])

    render :text => 'success'
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy

    render :text => "success"
  end
end

