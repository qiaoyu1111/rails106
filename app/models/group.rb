class Group < ApplicationRecord
  has_many :votes, dependent: :destroy
end
