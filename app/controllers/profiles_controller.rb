class ProfilesController < ApplicationController
  def index
  end

  def create
  end

  def show
    @profile = Profile.where(user_id: params[:id]).first

  end

  def destroy
  end

  def new
  end

  def update
  end
end
