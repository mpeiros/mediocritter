class Tweet < ActiveRecord::Base
  belongs_to :search
  has_many :favorites

  def favorited_at(user_id)
    self.favorites.find_by(user_id: user_id).created_at
  end

  def get_favorite_id(user_id)
    self.favorites.find_by(user_id: user_id).id
  end

  def get_comments(user_id)
    self.favorites.find_by(user_id: user_id).comments
  end
end
