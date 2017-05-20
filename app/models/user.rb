class User < ActiveRecord::Base
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
end
