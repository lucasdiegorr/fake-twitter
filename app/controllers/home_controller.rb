class HomeController < ApplicationController
  before_action :set_paper_trail_whodunnit
  def index
  	if user_signed_in?
  		@posts = Post.where(user_id: current_user.followed.select(:follower_id))
		else  		
			@posts = Post.all
  	end
  end
end
