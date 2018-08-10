class LabTest < ApplicationRecord
  has_many :user_lab_tests
  has_many :users, through: :user_lab_tests
end
