class Link
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::MultiParameterAttributes
  
  field :title, :type => String
  field :url, :type => String
  field :description, :type => String

  belongs_to :linkable,:polymorphic => true
end
