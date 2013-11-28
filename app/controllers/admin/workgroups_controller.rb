class Admin::WorkgroupsController < ApplicationController

  before_filter :is_admin, :load_conf

  def index
    @workgroup_categories = WorkgroupCategory.order('created_at DESC')
  end

  def create
    new_workgroup = WorkgroupCategory.create(:name => 'nouveau', :is_published => false, :is_public => false)

    redirect_to admin_workgroups_path
  end

  def update
    params[:workgroup_names].each do |id, name|
      
      this_workgroup = WorkgroupCategory.find(id)
      this_workgroup.update_attributes(:name => name, :is_published => params[:workgroup_is_published][id], :is_public => params[:workgroup_is_public][id])
    end

    redirect_to admin_workgroups_path
  end

  def destroy
    WorkgroupCategory.find(params[:id]).destroy

    redirect_to admin_workgroups_path
  end

end

