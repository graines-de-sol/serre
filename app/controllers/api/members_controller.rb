class Api::MembersController < ApplicationController

  before_filter :load_conf
  layout 'iframe'

  # GET /members
  # List all members                                    HTML
  # --------------------------------------------------------
  def index
    @members = Member.order('first_name ASC')
  end

  # POST /members/search
  # Search for members                                  HTML
  # --------------------------------------------------------
  def search
    @members = Member.search_by params[:category], params[:keywords], params[:is_active]

    render :template => '/api/members/index'
  end

  # GET /member/:id
  # Show member's profile                               HTML
  # --------------------------------------------------------
  def show
    @member = Member.find(params[:id], :include=>:profiles)

    @user_profiles = @member.profiles.map{|p|{p.network_id=>p.url}}
    @pro_networks = Network.with_urls(@user_profiles, :pro)
    @perso_networks = Network.with_urls(@user_profiles, :perso)

  end

end

