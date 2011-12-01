class Occasion
  include Mongoid::Document
  field :occurred_at, :type => Time
  field :latitude, :type => Float
  field :longitude, :type => Float
  field :note, :type => String
  embedded_in :event, :inverse_of => :occasions
  validates :occurred_at, :latitude, :longitude, :presence => true 

  attr_accessible :occurred_at, :latitude, :longitude, :note
end
