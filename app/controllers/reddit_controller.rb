class RedditController < ApplicationController
  def index
    Reddit.getRedditArticles
    Reuter.destroy_all
    Reuter.getArticles
    @reuters = Reuter.all 
    @weather = Index.getWeather
    @redditsf = Reddit.where(sub: 'San Francisco').last(20)
    @redditsb = Reddit.where(sub: 'UC Santa Barbara').last(20)
    @redditnba = Reddit.where(sub: 'NBA').last(20)
  end
end
