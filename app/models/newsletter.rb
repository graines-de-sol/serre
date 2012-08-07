class Newsletter < ActiveRecord::Base

  # Fetch all published news since last newsletter sending
  def self.latest_news
    last_sent = self.where(['sent_on IS NOT NULL']).last

    if last_sent
      Post.where(['created_at > ? AND published = ?', last_sent.sent_on, true]).order('created_at DESC').all
    end
  end

end

