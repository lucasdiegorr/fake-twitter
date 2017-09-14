class ProfileController < ApplicationController
	before_action :authenticate_user!
  before_action :set_paper_trail_whodunnit
  before_action :set_user, only: [:show, :destroy]
  def myprofile
  	@user = User.find(current_user.id)
  end

  def show
    if current_user.id == params[:id].to_i
      redirect_to profile_myprofile_path
    end
  end

  def follow
    @follow = Follow.new(follower_id: params[:id], followed_id: current_user.id)
    respond_to do |format|
      if @follow.save

        format.html { redirect_to root_path, notice: "Agora você está seguindo #{User.find(params[:id]).first_name} #{User.find(params[:id]).last_name}." }
        format.json { render :show, status: :created, location: @follow }
      else
        format.html { render :new }
        format.json { render json: @follow.errors, status: :unprocessable_entity }
      end
    end
  end

  def search
      @users = User.where("first_name LIKE ? OR last_name LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%").where("id != ?", current_user.id)
  end

  def destroy
    @user.followers.destroy_all
    @user.followed.destroy_all
    @user.posts.destroy_all
    @user.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'O usuário foi apagado com sucesso.' }
      format.json { head :no_content }
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
