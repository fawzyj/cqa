class Question
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::MultiParameterAttributes

  field :title, :type => String

  belongs_to :category # , :as => :categorizable
  belongs_to :user
  
  has_and_belongs_to_many :answers
  
  has_and_belongs_to_many :tags, inverse_of: nil
end
