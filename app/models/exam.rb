class Exam < ApplicationRecord
  has_many :user_exams
  has_many :users, through: :user_exams
end
