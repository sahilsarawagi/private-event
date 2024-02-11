class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :event_attendances, foreign_key: "attended_event_id", class_name: "EventAttendee"
  has_many :attendees, through: :event_attendances, source: :attendee

  def future
    event_date>= Date.current
  end
  def past
    event_date< Date.current
  end
end
