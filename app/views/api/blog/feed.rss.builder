xml.instruct! :xml, :version=>"1.0"
xml.rss(:version=>"2.0", 'xmlns:atom' => 'http://www.w3.org/2005/Atom'){
  xml.channel{
    xml.title("Graines de sol")
    xml.link("http://serre.grainesdesol.fr/api/blog/feed.rss")
    xml.description("Les actus de la serre de graines de sol")
    xml.language("fr-FR")
    xml.tag! 'atom:link', :rel => 'self', :type => 'application/rss+xml', :href => "http://serre.grainesdesol.fr/api/blog/feed.rss"
    for post in @posts
      xml.item do
        xml.title(post.title)
        xml.description(post.content)

        xml.pubDate(I18n.l(post.published_at, :formats => :rss, :locale => :en))
        xml.link("http://serre.grainesdesol.fr/blog/#{post.id}")
        xml.guid("http://serre.grainesdesol.fr/blog/#{post.id}")
      end
    end
  }
}


