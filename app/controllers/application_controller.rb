class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :admin?

  before_filter :set_music, :load_current_events, :load_cart

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
      }]
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
