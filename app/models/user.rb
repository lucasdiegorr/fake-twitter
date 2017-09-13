class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  has_and_belongs_to_many :follows

  def self.admin?
  	self.admin
  end

  def followers
  	Follow.where(follower: self.id)
  end

  def followed
  	Follow.where(followed: self.id)
  end

  def following?(id = nil)
    self.followed.exists?(follower_id: id)
  end
end
