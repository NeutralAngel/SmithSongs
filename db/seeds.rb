# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Venue.delete_all
Event.delete_all
Product.delete_all
Order.destroy_all
Cart.destroy_all

if Rails.env.development?
  ActiveRecord::Base.connection.execute("delete from sqlite_sequence where name='events';")
  ActiveRecord::Base.connection.execute("delete from sqlite_sequence where name='venues';")
  ActiveRecord::Base.connection.execute("delete from sqlite_sequence where name='products';")
  ActiveRecord::Base.connection.execute("delete from sqlite_sequence where name='orders';")
  ActiveRecord::Base.connection.execute("delete from sqlite_sequence where name='carts';")

  Venue.create( name: 'McGillvery\'s',
                line1: '8315 US 31 S.',
                city: 'Indianapolis',
                state: 'IN',
                zip: '46227' )

  Venue.create( name: 'Nathan\'s Bar',
                line1: '5389 Evanston Ave.',
                city: 'Indianapolis',
                state: 'IN',
                zip: '46220' )

  Venue.create( name: 'Colorado Steakhouse',
                line1: '7940 US 31 S.',
                city: 'Indianapolis',
                state: 'IN',
                zip: '46227' )

  Event.create( begin_time:  '2013-10-31 05:00:00',
                end_time:    '2013-10-31 11:00:00', 
                event_date:  '2013-10-31',
                description: 'A Night on the Town is a collaboration of Steve Smith and 
                              several other musicians.',
                steve_show:   true,
                title:        'A Night on the Town',
                venue_id:     1 )

  Event.create( begin_time:  '2013-11-12 05:00:00',
                end_time:    '2013-11-12 11:00:00', 
                event_date:  '2013-11-12',
                description: 'A Night on the Town is a collaboration of Steve Smith and 
                              several other musicians.',
                steve_show:   true,
                title:        'Out and About',
                venue_id:     1 )

  Event.create( begin_time:  '2013-11-13 05:00:00',
                end_time:    '2013-11-13 23:00:00', 
                event_date:  '2013-11-13',
                description: 'A Night on the Town is a collaboration of Steve Smith and 
                              several other musicians.',
                steve_show:   true,
                title:        'Funk Soul Brother',
                venue_id:     1 )

  Event.create( begin_time:  '2013-11-14 05:00:00',
                end_time:    '2013-11-14 11:00:00', 
                event_date:  '2013-11-14',
                description: 'A Night on the Town is a collaboration of Steve Smith and 
                              several other musicians.',
                steve_show:   true,
                title:        'Parenthetical Heyenas',
                venue_id:     1 )

  Event.create( begin_time:  '2013-11-15 05:00:00',
                end_time:    '2013-11-15 11:00:00', 
                event_date:  '2013-11-15',
                description: 'A Night on the Town is a collaboration of Steve Smith and 
                              several other musicians.',
                steve_show:   true,
                title:        'Pussyfootin\' About',
                venue_id:     1 )

  Event.create( begin_time:  '2013-11-01 05:00:00',
                end_time:    '2013-11-01 11:00:00', 
                event_date:  '2013-11-01',
                description: 'A Night on the Town is a collaboration of Steve Smith and 
                              several other musicians.',
                steve_show:   true,
                title:        'Rip Roarin\' Good Time',
                venue_id:     1 )

  Event.create( begin_time:  '2013-11-02 05:00:00',
                end_time:    '2013-11-02 11:00:00', 
                event_date:  '2013-11-02',
                description: 'A Night on the Town is a collaboration of Steve Smith and 
                              several other musicians.',
                steve_show:   true,
                title:        'Bananas and Blow',
                venue_id:     1 )

  Event.create( begin_time:  '2013-11-04 05:00:00',
                end_time:    '2013-11-04 11:00:00', 
                event_date:  '2013-11-04',
                description: 'A Night on the Town is a collaboration of Steve Smith and 
                              several other musicians.',
                steve_show:   true,
                title:        'Terrapin Station',
                venue_id:     1 )

  Event.create( begin_time:  '2013-11-29 05:00:00',
                end_time:    '2013-11-29 11:00:00', 
                event_date:  '2013-11-29',
                description: 'A Night on the Town is a collaboration of Steve Smith and                             several other musicians.',
                steve_show:   true,
                title:        'Stationary Bikes',
                venue_id:     1 )

  Event.create( begin_time:  '2013-12-01 05:00:00',
                end_time:    '2013-12-01 11:00:00', 
                event_date:  '2013-12-01',
                description: 'A Night on the Town is a collaboration of Steve Smith and 
                              several other musicians.',
                steve_show:   true,
                title:        'Questions Left Unanswered',
                venue_id:     1 )

  Event.create( begin_time:  '2013-12-15 05:00:00',
                end_time:    '2013-12-15 11:00:00', 
                event_date:  '2013-12-15',
                description: 'A Night on the Town is a collaboration of Steve Smith and 
                              several other musicians.',
                steve_show:   true,
                title:        'This Should Not Appear',
                venue_id:     1 )

  Event.create( begin_time:  '2013-12-31 05:00:00',
                end_time:    '2013-12-31 11:00:00', 
                event_date:  '2013-12-31',
                description: 'A Night on the Town is a collaboration of Steve Smith and 
                              several other musicians.',
                steve_show:   true,
                title:        'Thou Shalt Not Pass',
                venue_id:     1 )

  Product.create( title:       'Start Today CD',
                  description: 'Steve\'s first full-length album.',
                  image_url:   'start_today275x269.jpg',
                  price:       14.99)
end

if Rails.env.production?
  # ...
end

