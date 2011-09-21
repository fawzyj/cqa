class Question
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::MultiParameterAttributes

  field :title, :type => String

  belongs_to :category # , :as => :categorizable
  belongs_to :user

  has_many :links , :as => :linkable
  has_many :articles

  has_and_belongs_to_many :answers
  
  has_and_belongs_to_many :tags, inverse_of: nil

  has_many :related_questions, :class_name => 'Question', :inverse_of => :parent_question
  belongs_to :parent_question, :class_name => 'Question', :inverse_of => :related_questions
end
