class Reuter < ActiveRecord::Base
  validates :title, uniqueness: true
  require 'open-uri'

  def self.getArticles
    reuters = Nokogiri::HTML(open("http://www.reuters.com/"))
    baseUrl = 'http://www.reuters.com'
    topstories = reuters.css('div#HP-Top-Stories')
    topstory = topstories.css('div.columnLeft div#topStory div.moduleBody div.topStory')
    title = topstory.css('h2').text
    link = topstory.css('h2 a').first.attributes['href'].value
    link = baseUrl+link
    topHash = {title: title, link: link}
    Reuter.create(topHash)

    columnRight = topstories.css('div.columnRight')
    featured = columnRight.css('div.feature')
    title = featured.css('h2 a').text
    link = featured.css('h2 a').first.attributes['href'].value
    link = baseUrl+link
    featuredHash = {title: title, link: link}
    Reuter.create(featuredHash)

    lastFeatured = columnRight.css('div.moduleBody ul li')
    lastFeatured.each do |a|
      link = a.css('a').first.attributes['href'].value
      title = a.css('a').text
      link = baseUrl+link
      hash = {title: title, link: link}
      Reuter.create(hash)
    end

    moreNews = reuters.css('div#moreSectionNews div.feature h2')
    moreNews.each do |n|
      link = n.css('a').first.attributes['href'].value
      title = n.css('a').text
      link = baseUrl+link
      hash = {title: title, link: link}
      Reuter.create(hash)
    end
  end
end
