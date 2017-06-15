class RecipesController < ApplicationController
  def index
    @search_param = params[:search_param] || 'mocha'
    @recipes = Recipe.for @search_param
  end
end
