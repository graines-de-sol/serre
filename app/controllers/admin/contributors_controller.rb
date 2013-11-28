class Admin::ContributorsController < ApplicationController

  before_filter :is_admin, :load_conf

  def index
    @members = Agreement.where(['action_id = ?', params[:workgroup_id]])
    @workgroup = WorkgroupCategory.find(params[:workgroup_id])
  end

  def create
    Agreement.create(:member_id => params[:member_id], :action => 'workgroup_category', :action_id => params[:workgroup_id], :consent => [])

    redirect_to admin_workgroup_contributors_path(params[:workgroup_id])
  end

  def update
    params[:agreement].each do |id, actions|
      agreement = Agreement.where(['member_id = ? AND action_id = ?', id, params[:workgroup_id]]).first
      consent = []
      actions.each do |key, value|
        consent.push key if value == 'true'
      end

      agreement.update_attributes(:consent => consent)
    end

    redirect_to admin_workgroup_contributors_path(params[:workgroup_id])
  end

  def destroy
    agreement = Agreement.where(['action_id = ? and member_id = ?', params[:workgroup_id], params[:id]]).first
    agreement.destroy

    redirect_to admin_workgroup_contributors_path(params[:workgroup_id])
  end

end

