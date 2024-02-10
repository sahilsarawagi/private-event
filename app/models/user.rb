class User < ApplicationRecord
  has_many :events, foreign_key: "creator_id"
  has_many :event_attendances, foreign_key: "attendee_id", class_name: "EventAttendee"
  has_many :attended_events, through: :event_attendances, source: :attended_event

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
