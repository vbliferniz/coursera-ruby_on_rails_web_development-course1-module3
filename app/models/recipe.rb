require 'httparty'
require 'pp'

class Recipe
  include HTTParty

  key_value = ENV["FOOD2FORK_KEY"]
  host = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'www.food2fork.com'

  base_uri "http://#{host}/api"
  default_params({key: key_value})
  format :json

  def self.for(search_term)
    get('/search', query: { q: search_term})['recipes']
  end
end

pp Recipe.for 'chocolate'
