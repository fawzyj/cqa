class SearchController < ApplicationController

  def search_by_category
    @questions = Question.where(:category_name => params[:search_term])
    @articles = Article.where(:category_name => params[:search_term])
    render 'search/results'
  end

  def search_by_tag
    @questions = Question.where(:tags => params[:search_term]).all
    @articles = Article.where(:tags => params[:search_term]).all
    render 'search/results'
  end

end
