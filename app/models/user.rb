class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_paper_trail
  
  has_many :posts, dependent: :destroy

  validates :first_name, presence: true, length: { maximum: 100 }
  validates :last_name, presence: true, length: { maximum: 100 }

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
