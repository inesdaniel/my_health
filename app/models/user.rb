class User < ApplicationRecord
  has_secure_password

  has_many :shots
  has_many :vitals
  has_many :lab_tests
  has_many :user_exams
  has_many :exams, through: :user_exams
  has_many :meds
end
