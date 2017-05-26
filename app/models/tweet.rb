class Tweet < ActiveRecord::Base
  belongs_to :search
  has_many :favorites

  def favorited_at(user_id)
    self.favorites.find_by(user_id: user_id).created_at
  end
end
