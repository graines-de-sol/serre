class Iframes::MembersController < ApplicationController

  before_filter :load_conf
  layout 'iframe'

  # GET /iframes/members
  # List all members                                    HTML
  # --------------------------------------------------------
  def index
    @members = Member.www_published.order('first_name ASC')
  end

  # POST /iframes/members/search
  # Search for members                                  HTML
  # --------------------------------------------------------
  def search
    @members = Member.www_published.search_by(params[:category], params[:keywords], params[:is_active])

    render :template => '/iframes/members/index'
  end

  # GET /iframes/members/:id
  # Show member's profile                               HTML
  # --------------------------------------------------------
  def show
    @member = Member.www_published.where(['members.id = ?', params[:id]]).first

    raise ActiveRecord::RecordNotFound.new(:not_found) if !@member

  end

end

