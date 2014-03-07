class WorkgroupsController < ApplicationController

  before_filter :is_logged, :load_conf

  def index
    public_workgroups = WorkgroupCategory.public.published
    private_workgroups = Agreement.where(['member_id = ? AND consent LIKE ?', current_user.member.id, "%access%"])

    if public_workgroups.any?
      redirect_to workgroup_path(public_workgroups.first.id)
    elsif public_workgroups.empty? && !private_workgroups.empty?
      redirect_to workgroup_path(private_workgroups.first.action_id)
    end
  end

  def show
    @category = WorkgroupCategory.find(params[:id])
  end

  def photos
    @category = WorkgroupCategory.find(params[:id])

    render :template => '/workgroups/show'
  end  

  def files
    @category = WorkgroupCategory.find(params[:id])

    render :template => '/workgroups/show'
  end   

  def participants
    @category = WorkgroupCategory.find(params[:id])
    @members = Agreement.where(['action_id = ?', params[:id]])

    render :template => '/workgroups/show'
  end  

  def comments
    @category = WorkgroupCategory.find(params[:id])
    @members = Agreement.where(['action_id = ?', params[:id]])

    render :template => '/workgroups/show'
  end

  def create_comment
    @category = WorkgroupCategory.find(params[:id])
    @members = Agreement.where(['action_id = ?', params[:id]])

    Comment.create(:content => params[:comment], :workgroup_category_id => params[:id], :member_id => current_user.member.id)

    redirect_to comments_workgroup_path(params[:id])
  end

  def delete_comment
    comment = Comment.find(params[:id])
    workgroup_id = comment.workgroup_category_id

    @category = WorkgroupCategory.find(workgroup_id)
    @members = Agreement.where(['action_id = ?', workgroup_id])

    comment.destroy

    redirect_to comments_workgroup_path(workgroup_id)
  end

  def notify_participants
    if params[:member]
      workgroup = WorkgroupCategory.find(params[:id])
      Workgroup.notify_members(
        :ids => params[:member][:ids], 
        :workgroup => workgroup.name, 
        :message => params[:message],
        :current_user => current_user
      )

      if params[:member][:ids].count == 1
        session[:notice] = t('email.email_sent')
      else
        session[:notice] = t('email.emails_sent', :count => params[:member][:ids].count)
      end
    else
      session[:notice] = t('email.please_check_participants')
    end      

    redirect_to participants_workgroup_path(params[:id])
  end

  def create
    @category = WorkgroupCategory.find(params[:id])
  end

  def upload_file
    params[:workgroup] = {}
    params[:workgroup][:workgroup_category_id] = params[:id]
    params[:workgroup][:file] = params[:qqfile]
    Workgroup.create!(params[:workgroup])

    render :json => {:success => true}
  end

  def delete_file
    workgroup_category = Workgroup.find(params[:id]).workgroup_category_id
    Workgroup.find(params[:id]).destroy

    redirect_to files_workgroup_path(workgroup_category)
  end
  
  def download
    file = Workgroup.find(params[:id])

    send_file "#{Rails.root}/workgroups/#{file.id}/#{file.locator}",
      :type        => file.mime_type,
      :filename    => file.filename,
      :x_sendfile  => true,
      :disposition => 'attachment'
  end

  def upload_photo
    Picture.create(:image => params[:qqfile], :workgroup_category_id => params[:workgroup_category_id])

    render :json => {:success => true}
  end

  def delete_photo
    picture = Picture.find(params[:id]).destroy

    redirect_to photos_workgroup_path(picture.workgroup_category_id)
  end

end

