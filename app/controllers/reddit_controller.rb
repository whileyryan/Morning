class RedditController < ApplicationController
  def index
    Reddit.getRedditArticles
    Reuter.destroy_all
    Reuter.getArticles
    @reuters = Reuter.all 
    @weather = Index.getWeather
    @redditsf = Reddit.where(sub: 'San Francisco').last(25)
    @redditsb = Reddit.where(sub: 'UC Santa Barbara').order(created_at: :desc).limit(25).reverse
    @redditnba = Reddit.where(sub: 'NBA').last(25)
  end
end
