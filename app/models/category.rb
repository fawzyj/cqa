class Category
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::MultiParameterAttributes

  field :name, :type => String

  has_many :articles
  has_many :questions

  has_many :child_categories, :class_name => 'Category', :inverse_of => :parent_category
  belongs_to :parent_category, :class_name => 'Category', :inverse_of => :child_categories
end
