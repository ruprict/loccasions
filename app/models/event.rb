class Event
  include Mongoid::Document
  field :name, :type => String
  field :description, :type => String
  embedded_in :user, :inverse_of => :events
  validates :user, :name, :presence => true
end
