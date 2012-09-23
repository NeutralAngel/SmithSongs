class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_music

  def set_music
    @music_list = 
      [ 
      { title: "Cro Magnon Man", 
        mp3:"http://www.jplayer.org/audio/mp3/TSP-01-Cro_magnon_man.mp3"
      },
      {
        title: "Your Face",
        mp3: "http://www.jplayer.org/audio/mp3/TSP-05-Your_face.mp3"
      }]
  end
end
