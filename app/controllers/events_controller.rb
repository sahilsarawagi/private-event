class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create]

  def index
    @events = Event.all
    @events_future = @events.future
    @events_past = @events.past
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show 
    @event = Event.find(params[:id])
  end
  private
    def event_params
      params.require(:event).permit(:title, :description,:event_location,:event_date)
    end
end
