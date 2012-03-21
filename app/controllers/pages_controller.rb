class PagesController < ApplicationController

  before_filter :is_admin, :except=>:upload
  before_filter :load_conf

  # GET /pages/:id
  # Show pages in given category                                 HTML
  # -----------------------------------------------------------------
  def show
    @articles = Article.where(['
      (location_id = ?
      OR location_id = 0)
      AND category = ?
      ', current_user.member.location_id, params[:id]
    ]).order('created_at DESC')

    @locations = Location.all
  end

  # POST /pages
  # Create new article                                       REDIRECT
  # -----------------------------------------------------------------
  def create

    Article.create(params[:article])

    redirect_to "/pages/#{params[:article][:category]}"

  end

  # POST /pages/:id
  # Update an article                                        REDIRECT
  # -----------------------------------------------------------------
  def update

    Article.find(params[:id]).update_attributes(params[:article])

    redirect_to "/pages/#{params[:article][:category]}"

  end

  # DELETE /pages/:id
  # Delete an article                                        REDIRECT
  # -----------------------------------------------------------------
  def destroy
    delete_article = Article.destroy(params[:id])

    redirect_to "/pages/#{delete_article.category}"

  end

  def upload
    Uploader.save(params[:image])
  end

end

