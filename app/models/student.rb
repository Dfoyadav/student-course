class Student < ApplicationRecord
  belongs_to :course
  validates :name, presence: true
end
