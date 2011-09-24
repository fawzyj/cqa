class HomeController < ApplicationController
  def index
    @questions = Question.limit(5)
    @articles = Article.limit(5)
  end

  def about
  end

end
