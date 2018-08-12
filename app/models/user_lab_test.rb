class UserLabTest < ApplicationRecord
  belongs_to :user 
  belongs_to :lab_test
end
