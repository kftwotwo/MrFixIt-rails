class JobsController < ApplicationController

  def index
    @jobs = Job.all
  end

  def new
   @job = Job.new
   render :new
  end

  def show
    @job = Job.find(params[:id])
    if params[:pending]
      @job.update(:pending => true)
    end
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      respond_to do |format|
        format.html { redirect_to jobs_url }
        format.js
      end
    end
  end

  def update
    @job = Job.find(params[:id])
    if current_worker
      if @job.update(pending: false, worker_id: current_worker.id)
        flash[:notice] = "You've successfully claimed this job."
        respond_to do |format|
          format.html { worker_path(current_worker) }
          format.js
        end
      else
        render :show
        flash[:notice] = "Something went wrong!"
      end
    else
      # We need to streamline this process better in the future! - Mr. Fix-It.
      flash[:notice] = 'You must have a worker account to claim a job. Register for one using the link in the navbar above.'
      redirect_to job_path(@job)
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to root_path
  end

private

  def job_params
    params.require(:job).permit(:title, :description)
  end

end
