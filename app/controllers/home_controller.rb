class HomeController < ApplicationController
  def index
  	if user_signed_in?
  		@posts = Post.where(user_id: current_user.followed.select(:follower_id))
		else  		
			@posts = Post.all
  	end
  end
end
