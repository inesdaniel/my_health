class UserVital < ApplicationRecord
  belongs_to :user 
  belongs_to :vital
end
