class FollowersController < ApplicationController

  def create
    @following = Follower.new(follower_params)
    @following.save

    @follower = User.find(params[:follower][:follower_id])
    @followee = User.find(params[:follower][:followee_id])

    if @following.save
      flash[:info] = "You are now following #{@followee.profile.full_name}"
    else
      flash[:info] = "There has been an error"
    end

    redirect_to profile_path(@followee.profile.id)
  end

  def destroy
  end

  private
  def follower_params
    params.require(:follower).permit(:follower_id, :followee_id)
  end

end
