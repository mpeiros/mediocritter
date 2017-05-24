class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :tweet
  has_many :comments
end
