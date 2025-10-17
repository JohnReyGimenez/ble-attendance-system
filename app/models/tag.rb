class Tag < ApplicationRecord
  belongs_to :student, optional: true

  validates :mac_address, presence: true, uniqueness: true
end
