class Profile < ActiveRecord::Base

  belongs_to :member
  belongs_to :network

  # Update all social network's profile for a member
  def self.update(params, member_id)

    params.each do |id, url|
      profile = Profile.where(:network_id=>id.to_i, :member_id=>member_id).first
      if profile
        if url.strip.blank?
          profile.destroy
        elsif url != profile[:url]
          profile.update_attributes(:url=>url)
        end
      else
        if !url.strip.blank?
          Profile.create(:member_id=>member_id, :network_id=>id, :url=>url)
        end
      end
    end

  end

end

