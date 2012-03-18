class PagesController < ApplicationController

  before_filter :is_logged, :load_conf

  # GET /pages/:id
  # Show pages in given category                                 HTML
  # -----------------------------------------------------------------
  def show
    @pages = Page.where(['
      (location_id = ?
      OR location_id = 0)
      AND category = ?
      ', current_user.member.location_id, params[:id]
    ])

    @locations = Location.all
  end

  # POST /pages
  # Create new article                                       REDIRECT
  # -----------------------------------------------------------------
  def create

    Page.create(params[:page])

    redirect_to "/pages/#{params[:page][:category]}"

  end

end

