class ProfileController < ApplicationController
	before_action :set_user, only: [:show]
  def myprofile
  	@user = User.find(current_user.id)
  end

  def show
    if current_user.id == params[:id].to_i
      redirect_to profile_myprofile_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:user_id, :content)
    end
end
