class Shot < ApplicationRecord
  has_many :user_shots
  has_many :users, through: :user_shots
end
