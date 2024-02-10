class AddReferencesToEventAttendances < ActiveRecord::Migration[7.1]
  def change
    add_reference :event_attendees, :attendee , foreign_key: {to_table: :users}
    add_reference :event_attendees, :attended_event, foreign_key: {to_table: :events}
  end
end
