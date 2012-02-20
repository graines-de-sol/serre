class MembersController < ApplicationController

  before_filter :is_logged

  # GET /members
  # List all members                                    HTML
  # --------------------------------------------------------
  def index
    @members = Member.all
  end

  # GET /member/:id
  # Show member's profile                               HTML
  # --------------------------------------------------------
  def show
    @member = Member.find(params[:id])
    template = Member.can_edit?(current_user.role, @member.id)? 'edit' : 'show'

    render :template=>"/members/#{template}"
  end

  # POST /members
  # Create a new user                               REDIRECT
  # --------------------------------------------------------
  def create
    new_user = User.create(params[:user])

    if new_user.id
      redirect_to member_path(new_user.member.id)
    else
      flash[:notice] = t('warnings.check_new_user_parameters')
      redirect_to members_path
    end
  end

  # PUT /members/:id
  # Update a member                                 REDIRECT
  # --------------------------------------------------------
  def update
    this_member = Member.find(params[:id])
    this_member.update_attributes(params[:member])

    redirect_to member_path(params[:id])
  end

  # DELETE /members/:id
  # Delete a member                                 REDIRECT
  # --------------------------------------------------------
  def destroy
    User.destroy(params[:id])

    redirect_to members_path
  end

end

