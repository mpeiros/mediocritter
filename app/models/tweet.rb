class Tweet < ActiveRecord::Base
  belongs_to :search
  has_many :favorites
end
