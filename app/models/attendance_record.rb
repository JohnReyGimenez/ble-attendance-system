class AttendanceRecord < ApplicationRecord
  belongs_to :student

  validates :mac_address, presence: true,
            format: { with: /\A([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})\z/,
                      message: "must be a valid MAC address format" }
  validates :event_type, presence: true, inclusion: { in: %w[entered exited] }
  validates :timestamp, presence: true
end
