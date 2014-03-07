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
      respond_to do |format|
        format.rss { render :layout => false, :template => '/api/blog/feed' }
      end
    end

  end

end

