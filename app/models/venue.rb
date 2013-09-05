class Venue < ActiveRecord::Base
  attr_accessible :city, :line1, :line2, :name, :state, :zip, :photo_url
  has_many :events

  before_save :make_photo_url_nil_if_empty

	def make_photo_url_nil_if_empty
	  self.photo_url = nil if self.photo_url.empty?
	end

end
