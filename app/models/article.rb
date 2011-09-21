class Article
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::MultiParameterAttributes

  field :title, :type => String
  field :body, :type => String

  belongs_to :category
  belongs_to :user
  belongs_to :question

  has_many :links , :as => :linkable

  has_and_belongs_to_many :tags, inverse_of: nil
end
