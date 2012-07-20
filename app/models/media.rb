require 'extend_string.rb'

class Media < ActiveRecord::Base

  set_table_name 'medias'

  attr_accessor :file

  belongs_to :media_category
  validate :upload
  before_save :upload
  after_save :write_to_disk
  before_destroy :remove_from_fs
  validates :filename, :uniqueness => { :scope => :media_category_id, :message => "already_uploaded" }

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
      Dir.mkdir("#{Rails.root}/medias/#{self.id.to_i}")
      File.open("#{Rails.root}/medias/#{self.id.to_i}/#{self.locator}", 'wb') { |f| f.write(self.file.read) }
    rescue
      self.destroy
      errors.add(:filename, 'error_occured_while_uploading')
    end
  end

  def remove_from_fs
    FileUtils.rm_rf("#{Rails.root}/medias/#{self.id.to_i}")
  end
end

