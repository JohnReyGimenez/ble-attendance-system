class AttendanceRecord < ApplicationRecord
  belongs_to :student

  validates :mac_address, presence: true
  validates :event_type, inclusion: { in: %w[entered exited] }
  validates :timestamp, presence: true
end
