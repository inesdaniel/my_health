class Medication < ApplicationRecord
  has_many :user_meds
  has_many :users, through: :user_meds
end
