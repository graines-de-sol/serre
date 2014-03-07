xml.instruct! :xml, :version=>"1.0"
xml.rss(:version=>"2.0"){
  xml.channel{
    xml.title("Graines de sol")
    xml.link("http://www.grainesdesol.fr")
    xml.description("Les actus de la serre de graines de sol")
    xml.language("fr_FR")
    for post in @posts
      xml.item do
        xml.title(post.title)
        xml.description(post.content)

        xml.pubDate(I18n.l post.published_at)
        xml.link("http://serre.grainesdesol.fr/blog/#{post.id}")
      end
    end
  }
}


