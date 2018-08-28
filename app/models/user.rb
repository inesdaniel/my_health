class User < ApplicationRecord
  has_secure_password

  has_many :user_shots
  has_many :shots, through: :user_shots

  has_many :user_vitals
  has_many :vitals, through: :user_vitals

  has_many :user_lab_tests
  has_many :lab_tests, through: :user_lab_tests

  has_many :user_exams
  has_many :exams, through: :user_exams
  
  has_many :meds

  has_many :results
end
