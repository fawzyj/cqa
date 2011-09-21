module ApplicationHelper
  def categories
    Category.all
  end

  def tags
    Tag.all
  end
end
