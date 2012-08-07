class Newsletter < ActiveRecord::Base

  # Fetch all published news since last newsletter sending
  def self.latest_news
    last_sent = self.where(['sent_on IS NOT NULL']).last
    last_sent ? start_date = last_sent.sent_on : start_date = '2010-01-01 00:00:00'.to_date

    Post.where(['created_at > ? AND published = ?', start_date, true]).order('created_at DESC').all

  end

end

