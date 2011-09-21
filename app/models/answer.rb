class Answer
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::MultiParameterAttributes

  field :body, :type => String

  belongs_to :user

  has_and_belongs_to_many  :questions
end
