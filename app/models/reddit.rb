class Reddit < ActiveRecord::Base
  validates :title, uniqueness: true
  require 'open-uri'

  def self.getRedditArticles
    page = Nokogiri::HTML(open("http://www.reddit.com/r/sanfrancisco"))
    articles = page.css('div#siteTable div.thing')
    articles.each do |art| 
      title = art.css('div.entry p.title a.may-blank').text
      href = art.css('div.entry p.title a')[0]['href']
      if !href.include? 'http'
        href = "http://www.reddit.com"+href
      end
      domain = art.css('span.domain').text
      time = art.css('p.tagline time.live-timestamp').text
      hash = {title: title, href: href, domain: domain, time: time}
      Reddit.create(hash)
    end
  end
end
