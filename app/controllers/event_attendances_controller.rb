class EventAttendancesController < ApplicationController
  
  def new
      render
      @event_attendees = EventAttendee.new
      puts params
  end

  def create
    # puts params[:attended_event_id]
    puts params
    puts "hello"
    @attendee = current_user.event_attendances.build(attendee_params)

    if @attendee.save
      puts "your attendance is registered"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def attendee_params
      params.permit(:attended_event_id)
    end
end
