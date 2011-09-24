class Article
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::MultiParameterAttributes

  before_save :assign_relations

  field :title, :type => String
  field :body, :type => String
  field :category_name, :type => String
  field :tags, :type => Array ,:default => []

  belongs_to :category
  belongs_to :user
  belongs_to :question

  has_many :links , :as => :linkable

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
  end




end
