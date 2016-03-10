class JobsController < ApplicationController
  
  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
    @boats = Boat.where(user_id: current_user.id)
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.save

    if @job.save
      redirect_to job_path(@job.id)
      flash[:info] = "Job Successfully Created"
    else
      render :new
      flash[:info] = "There Was An Error Creating The Job"
    end
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

  def assigned
    @jobs = Job.assigned
  end

  def unassigned
    @jobs = Job.unassigned
  end

  def assign_job
    @job = Job.find(params[:id])
    @job.update(boat_id: params[:job][:boat_id])

    if @job.save
      redirect_to job_path(@job.id)
      flash[:info] = "Job Assigned Successfully"
    else
      render :show
      flash[:info] = "There was an errod assigning the job."
    end
  end

  private
  def job_params
    params.require(:job).permit(:boat_id, :ctn_need, :cargo, :origin, :cost, :destination)
  end
end
