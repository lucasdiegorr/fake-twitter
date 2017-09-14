class Follow < ActiveRecord::Base
  has_paper_trail
  
  belongs_to :follower
  belongs_to :followed
end
