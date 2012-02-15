class MembersController < ApplicationController

  before_filter :is_logged

  # GET /members
  # List all members                                 HTML
  # -----------------------------------------------------
  def index
    @members = Member.all
  end

  # GET /member/:id
  # Show member's profile                              HTML
  # -------------------------------------------------------
  def show
    @member = Member.find(params[:id])
  end

  # POST /members
  # Create a new user                               REDIRECT
  # --------------------------------------------------------
  def create
    new_user = User.create(params[:user])
    new_member = Member.create(:user_id=>new_user.id)

    redirect_to member_path(new_member.id)
  end

  # PUT /members/:id
  # Update a member                                 REDIRECT
  # --------------------------------------------------------
  def update
    this_member = Member.find(params[:id])
    this_member.update_attributes(params[:member])

    redirect_to member_path(params[:id])
  end

end

