class Iframes::MembersController < ApplicationController

  before_filter :load_conf
  layout 'iframe'

  # GET /iframes/members
  # List all members                                    HTML
  # --------------------------------------------------------
  def index
    @members = Member.where(:www_published => true).order('first_name ASC')
  end

  # POST /iframes/members/search
  # Search for members                                  HTML
  # --------------------------------------------------------
  def search
    @members = Member.search_by params[:category], params[:keywords], params[:is_active]

    render :template => '/iframes/members/index'
  end

  # GET /iframes/member/:id
  # Show member's profile                               HTML
  # --------------------------------------------------------
  def show
    @member = Member.find(params[:id], :include=>:profiles)
  end

end

