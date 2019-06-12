class Appointment < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :patients
  accepts_nested_attributes_for :patients
end
