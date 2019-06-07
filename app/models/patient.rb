class Patient < ApplicationRecord
  belongs_to :user
  belongs_to :appointment, optional: true
end
