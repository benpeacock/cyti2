class EventsController < ApplicationController
  before_action :set_event, only: [:edit, :update, :destroy]
  before_filter :authorize

  # GET /events
  # GET /events.json
  def index
    @events = Event.ordered(params[:sort]).paginate(:per_page => 10, :page => params[:page])
    #@events = Event.all.search(params[:search]).paginate(:per_page => 10, :page => params[:page])
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.create(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to events_path, notice: 'Event was successfully created.' }
        format.json { render action: 'show', status: :created, location: @event }
      else
        format.html { render action: 'new' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    @event = Event.update(event_params)

    respond_to do |format|
      if @event
        format.html { redirect_to events_path, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit', notice: 'Event not updated.' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    # Using 'id' instead of 'objectId' here since Rails sets objectId passed in params to 'id'
    @event = Event.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end

  private
    # GET from Parse by objectId
    def set_event
      # Using 'id' instead of 'objectId' here since Rails sets objectId passed in params to 'id'
      @event = Event.find_by_objectId(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.permit(:objectId, :id, :address, :endDate, :imageThumbUrl, :moreInfo, :shortDescription, :title, :utf8, :_method, :authenticity_token, :commit)
    end
end
