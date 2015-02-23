class Reddit < ActiveRecord::Base
  validates :title, uniqueness: true
  require 'open-uri'


  def self.getRedditArticles
    reddit_array = ['http://www.reddit.com/r/ucsantabarbara', 'http://www.reddit.com/r/sanfrancisco', 'http://www.reddit.com/r/nba']
    reddit_array.each do |web|
      reddit = Nokogiri::HTML(open("#{web}"))
      sub = reddit.css('title').text
      articles = reddit.css('div#siteTable div.thing')
      articles.each do |art| 
        title = art.css('div.entry p.title a.may-blank').text
        href = art.css('div.entry p.title a')[0]['href']
        if !href.include? 'http'
          href = "http://www.reddit.com"+href
        end
        domain = art.css('span.domain').text
        time = art.css('p.tagline time.live-timestamp').text
        hash = {title: title, href: href, domain: domain, time: time, sub: sub}
        Reddit.create(hash)
      end
    end
  end
end
