class RedditController < ApplicationController
  def index
    Reddit.getRedditArticles
    @reddit = Reddit.all
  end
end
