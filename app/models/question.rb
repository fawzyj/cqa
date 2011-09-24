class Question
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::MultiParameterAttributes

  before_save :assign_relations
  # before_update :assign_relations

  field :title, :type => String
  field :category_name, :type => String
  field :tags, :type => Array ,:default => []

  belongs_to :category # , :as => :categorizable
  belongs_to :user

  has_many :links , :as => :linkable
  has_many :articles

  has_and_belongs_to_many :answers
  
  # has_and_belongs_to_many :tags, inverse_of: nil

  has_many :related_questions, :class_name => 'Question', :inverse_of => :parent_question
  belongs_to :parent_question, :class_name => 'Question', :inverse_of => :related_questions

  # attr_writer :tag_names
  def tag_names=(names)
    @tag_names = names
    self.tags = @tag_names.split(/,/).map do |tag|
      Tag.find_or_create_by(:name => tag.strip)
      tag.strip
    end
  end
  
  def tag_names
    @tag_names || self.tags.join(' , ')
  end

  

  def assign_relations
    self.category_name = self.category.name
    #self.tags = @tag_names.split(/,/).map do |tag|
    #  Tag.find_or_create_by(:name => tag.strip)
    #  tag.strip
    #end
  end
end
