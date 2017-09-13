class HomeController < ApplicationController
  def index
  	if user_signed_in?
  		@posts = current_user.posts.all
		else  		
			@posts = Post.all
  	end
  end
end
