class User < ApplicationRecord
  has_many :shots
  has_many :vitals
  has_many :lab_tests
  has_many :exams
  has_many :meds
end
