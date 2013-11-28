require 'extend_string.rb'

class Workgroup < ActiveRecord::Base

  attr_accessor :file

  belongs_to :workgroup_category

  validate :upload
  before_save :upload
  after_save :write_to_disk
  before_destroy :remove_from_fs
  validates :filename, :uniqueness => { :scope => :workgroup_category_id, :message => "already_uploaded" }

  def self.notify_members(args = {})
    
    members = Member.find(args[:ids])
    current_user = args[:current_user]

    members.each do |member|
      Notifier.workgroup_notify_members({
        :reply_addr   => "contact@grainesdesol.fr",
        :to           => member.user.email,
        :workgroup    => args[:workgroup],
        :body         => args[:message],
        :current_user => current_user
      }).deliver
    end
  
  end

private
  def upload
    if self.file.blank?
      errors.add(:filename, 'no_file')
    else
      self.mime_type = self.file.content_type
      self.locator = Digest::SHA1.hexdigest rand.to_s
      self.filesize = File.size(self.file.tempfile)

      basename  = File.basename(self.file.original_filename, '.*').urlize
      extension = self.file.original_filename.split('.').pop().downcase
      self.filename = "#{basename}.#{extension}"
      self.name = basename if self.name.blank?
    end
  end

  def write_to_disk
    begin
      Dir.mkdir("#{Rails.root}/workgroups/#{self.id.to_i}")
      File.open("#{Rails.root}/workgroups/#{self.id.to_i}/#{self.locator}", 'wb') { |f| f.write(self.file.read) }
    rescue
      self.destroy
      errors.add(:filename, 'error_occured_while_uploading')
    end
  end

  def remove_from_fs
    FileUtils.rm_rf("#{Rails.root}/workgroups/#{self.id.to_i}")
  end
end

