class Student < ApplicationRecord
  has_one :tag, dependent: :nullify
  
  validates :name, presence: true
  validates :student_id_number, presence: true, uniqueness: true
end
