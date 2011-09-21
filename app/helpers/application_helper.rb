module ApplicationHelper
  def categories
    Category.all
  end

  def tags
    Tag.all
  end

  def questions
    Question.all
  end

  def articles
    Article.all
  end
end
