class Post < ActiveRecord::Base
  has_paper_trail
  
  belongs_to :user

	validates :content, presence: true

end
