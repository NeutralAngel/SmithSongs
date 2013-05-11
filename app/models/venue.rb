class Venue < ActiveRecord::Base
  attr_accessible :city, :line1, :line2, :name, :state, :zip, :photo_url
  has_many :events
end
