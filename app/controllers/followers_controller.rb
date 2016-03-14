class FollowersController < ApplicationController

  def create

    @following = Follower.new(follower_params)
    @following.save

    @follower = User.find(params[:follower][:follower_id])
    @followee = Boat.find(params[:follower][:boat_id])
    @name = @follower.profile.full_name

    respond_to do |format|
      format.js
    end

  end

  def destroy
    @following = Follower.find(params[:id])
    @boat = Boat.find(@following.boat_id)
    @following.destroy

    if @following.destroy
      flash[:info] = "You are no longer following #{@boat.name}"
    else
      flash[:info] = "There has been an error"
    end

    redirect_to boat_path(@boat.id)
  end

  private
  def follower_params
    params.require(:follower).permit(:follower_id, :boat_id)
  end

end
