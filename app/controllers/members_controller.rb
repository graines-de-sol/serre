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
    @member = Member.find(params[:id], :include=>:profiles)

    if Member.can_edit?(current_user.role, @member.id)
      @user_profiles = @member.profiles.map{|p|{p.network_id=>p.url}}
      @pro_networks = Network.with_urls(@user_profiles, :pro)
      @perso_networks = Network.with_urls(@user_profiles, :perso)

      render :template=>'/members/edit'
    else
      render :template=>'/members/show'
    end
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

    this_user = User.find(this_member.user_id)
    this_user.update_attributes(params[:user])

    Profile.update(params[:profile], current_user.member.id)

    flash[:notice] = t('warnings.check_new_user_parameters') if !this_user

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

