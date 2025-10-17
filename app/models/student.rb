class Student < ApplicationRecord
  has_one :tag, dependent: :nullify
end
