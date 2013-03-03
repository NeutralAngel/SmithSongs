class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :admin?

  before_filter :set_music, :load_current_events

  def set_music
    @music_list = 
      [ 
      { title: "Start Today", 
        mp3:"https://s3.amazonaws.com/SmithSongsNN/music/StartToday.mp3"
      },
      {
        title: "Clark Whiteleather",
        mp3: "https://s3.amazonaws.com/SmithSongsNN/music/ClarkWhiteleather.mp3"
      },
      { title: "Think Up", 
        mp3:"https://s3.amazonaws.com/SmithSongsNN/music/ThinkUp.mp3"
      },
      { title: "Bad Seed", 
        mp3:"https://s3.amazonaws.com/SmithSongsNN/music/BadSeed.mp3"
      },
      { title: "Further Forever", 
        mp3:"https://s3.amazonaws.com/SmithSongsNN/music/FurtherForever.mp3"
      },
      { title: "Ghost of Tuesday", 
        mp3:"https://s3.amazonaws.com/SmithSongsNN/music/GhostOfTuesday.mp3"
      },
      { title: "High Water", 
        mp3:"https://s3.amazonaws.com/SmithSongsNN/music/HighWater.mp3"
      },
      { title: "Going to the Well", 
        mp3:"https://s3.amazonaws.com/SmithSongsNN/music/GoingToTheWell.mp3"
      },
      { title: "Golden State", 
        mp3:"https://s3.amazonaws.com/SmithSongsNN/music/GoldenState.mp3"
      },
      { title: "Summers Warm", 
        mp3:"https://s3.amazonaws.com/SmithSongsNN/music/SummersWarm.mp3"
      },
      { title: "I Believe", 
        mp3:"https://s3.amazonaws.com/SmithSongsNN/music/IBelieve.mp3"
      },
     { title: "Be Here Now", 
        mp3:"https://s3.amazonaws.com/SmithSongsNN/music/BeHereNow.mp3"
      },
     { title: "No Good Reason", 
        mp3:"https://s3.amazonaws.com/SmithSongsNN/music/NoGoodReason.mp3"
      },
     { title: "Vollrath", 
        mp3:"https://s3.amazonaws.com/SmithSongsNN/music/Vollrath.mp3"
      },
      { title: "Gasoline > Golden State", 
        mp3:"https://s3.amazonaws.com/SmithSongsNN/music/GasolineGoldenState.mp3"
      }
    ]
  end

  def load_current_events
    # Retrieve next events
    @current_events = Event.where("event_date >= ?", Time.now.to_date).limit(10).order(:event_date)
  end

  def load_cart
    @cart = current_cart
  end

  private

    def current_cart
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
    end

    def admin?
      (session[:password] == ADMIN_PASSWORD) && (session[:user_name] == ADMIN_USERNAME)
    end

    def authorize
      unless admin?
        flash[:error] = "unauthorized access"
        redirect_to home_path
        false
      end
    end

end
