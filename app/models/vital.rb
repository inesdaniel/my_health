class Vital < ApplicationRecord
  has_many :user_vitals
  has_many :users, through: :user_vitals
end
