class JobsController < ApplicationController
  before_action :set_company, only: [:index, :new, :create]
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  def index
    @contact = Contact.new
    if params[:sort] == "interest"
      @jobs = @company.jobs.sort_by_interest  
    else
      @jobs = @company.jobs
    end
  end

  def new
    @job = Job.new()
    @categories = Category.all
  end

  def create
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
  end

  def edit
    @company = @job.company
    @categories = Category.all
  end

  def update
    @job.update(job_params)
    if @job.save
      flash[:success] = "#{@job.title} updated!"
      redirect_to company_job_path(@job.company, @job)
    else
      render :edit
    end
  end

  def destroy
    company = @job.company
    @job.delete

    flash[:success] = "#{@job.title} was successfully deleted!"
    redirect_to company_jobs_path(company)
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :category_id)
  end

  def set_company
    @company = Company.find(params[:company_id])
  end

  def set_job
    @job = Job.find(params[:id])
  end
end
