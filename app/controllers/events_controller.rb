class EventsController < ApplicationController
  # GET /events
  # GET /events.json

  before_filter :authorize, :except => [:index, :show]

  def index
    @events = Event.order(:event_date).all
    @events_by_date = @events.group_by(&:event_date)
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @current_events = Event.where("event_date >= ?", Time.now.to_date).order(:event_date)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @current_events.to_json(:include => [:venue])}
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event.to_json(:include => [:venue])}
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    set_times
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    set_times
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
        format.js
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
      format.js
    end
  end

  private

    def set_times
      begin_hour = params[:event]['begin_time(4i)']
      end_hour = params[:event]['end_time(4i)']
      begin_date = Date.parse(params[:event]['event_date'])

      params[:event]['begin_time(1i)'] = begin_date.year.to_s
      params[:event]['begin_time(2i)'] = begin_date.month.to_s
      params[:event]['begin_time(3i)'] = begin_date.mday.to_s

      if begin_hour <= end_hour
        end_date = begin_date
      else
        end_date = begin_date.next
      end

      params[:event]['end_time(1i)'] = end_date.year.to_s
      params[:event]['end_time(2i)'] = end_date.month.to_s
      params[:event]['end_time(3i)'] = end_date.mday.to_s
    end

end
