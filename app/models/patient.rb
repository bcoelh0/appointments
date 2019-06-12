class Patient < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :appointments
end
