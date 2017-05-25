class User < ActiveRecord::Base
  has_many :comments
  has_many :searches
  has_many :favorites
  has_many :favorited_tweets, through: :favorites, source: :tweet

  validates_presence_of :email, :username, :password_hash
  validates_uniqueness_of :email, :username

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(email, password)
    if @user = User.find_by(email: email)
      @user.password == password ? @user : nil
    end
  end

  def favorited?(tweet)
    self.favorited_tweets.each do |fav_tweet|
      if fav_tweet.tweet_time == tweet.tweet_time && fav_tweet.text == tweet.text
        return true        
      end
    end
    false    
  end
end
