class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    @job.update(job_params)
  end

  def destroy
    @job = Job.find(params[:id])
  end

  private
  def job_params
    params.require(:job).permit(:boat_id, :ctn_need, :cargo, :origin, :cost, :destination)
  end
end
