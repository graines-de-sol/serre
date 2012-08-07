class Admin::NewslettersController < ApplicationController

  before_filter :is_admin, :load_conf

  # GET /admin/newsletters
  # Show last newsletter                                   HTML
  # -----------------------------------------------------------
  def index
    @newsletter = Newsletter.last

    if @newsletter
      redirect_to admin_newsletter_path(@newsletter.id)
    else
      render :index
    end
  end

  # GET /admin/newsletters/:id
  # Show given newsletter                                  HTML
  # -----------------------------------------------------------
  def show
    @newsletter = Newsletter.last
    @newsletters = Newsletter.order('created_at DESC').all

    unless @newsletter.content
      @latest_news = Newsletter.latest_news
    end
  end

  # POST /admin/newsletters
  # Create newsletter                                  REDIRECT
  # -----------------------------------------------------------
  def create
    @newsletter = Newsletter.create

    redirect_to admin_newsletter_path(@newsletter.id)
  end

  # PUT /admin/newsletters/:id
  # Update newsletter                                      HTML
  # -----------------------------------------------------------
  def update
    @newsletter = Newsletter.find(params[:id]).update_attributes(params[:newsletter])

    if params[:send]
      Newsletter.find(params[:id]).update_attributes(:sent_on => Time.now)
    end

    redirect_to admin_newsletter_path(@newsletter.id)
  end

  # DELETE /admin/newsletters/:id
  # Delete newsletter                                   REDIRECT
  # -----------------------------------------------------------
  def destroy
    Newsletter.delete(params[:id])

    redirect_to admin_newsletters_path
  end

end

