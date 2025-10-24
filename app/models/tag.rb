class Tag < ApplicationRecord
  belongs_to :student, optional: true

  validates :mac_address, presence: true, uniqueness: true,
            format: { with: /\A([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})\z/, 
                      message: "must be a valid MAC address format" }
end
