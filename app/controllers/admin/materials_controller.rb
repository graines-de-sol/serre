class Admin::MaterialsController < ApplicationController

  before_filter :is_admin, :load_conf

  def index
    @workgroup = WorkgroupCategory.find(params[:workgroup_id])
  end

  def create
    workgroup = WorkgroupCategory.find(params[:workgroup_id])
    workgroup.update_attributes(params[:workgroup])

    redirect_to admin_workgroup_materials_path(params[:workgroup_id])
  end

  def destroy
    agreement = Agreement.where(['action_id = ? and member_id = ?', params[:workgroup_id], params[:id]]).first
    agreement.destroy

    redirect_to admin_workgroup_contributors_path(params[:workgroup_id])
  end

end

