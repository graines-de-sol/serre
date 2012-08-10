class Api::BlogController < ApplicationController

  before_filter :load_conf

  # GET /api/blog/feed
  # Ouput RSS feed                                          XML
  # -----------------------------------------------------------
  def feed

    @posts = Post.order('created_at DESC').all

    if @posts.empty?
      render :text => ''
    else
      headers['Content-Type'] = 'application/xml'
      respond_to do |format|
        format.html { render :html => '/api/blog/feed', :layout => false, :disposition => :inline }
      end
    end

  end

end

