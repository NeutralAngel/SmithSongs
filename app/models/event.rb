class Event < ActiveRecord::Base
  attr_accessible :begin_time, :description, :end_time, :event_date, :steve_show, :title, :venue_id
  belongs_to :venue
end
