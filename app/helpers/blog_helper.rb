module BlogHelper

  # Return formated date for blog post create/edit
  def get_post_date(post)
    if post
      post_date = {'formated' => l(post.published_at), 'raw' => post.published_at.strftime("%Y-%m-%d")}
    else
      post_date = {'formated' => l(Time.now), 'raw' => Time.now.strftime("%Y-%m-%d")}
    end
  end

  # Return formated hour for blog post create/edit
  def get_post_hour(post)
    if post
      post.published_at
    else
      Time.now()
    end
  end

end

