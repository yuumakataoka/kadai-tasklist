class TasksController < ApplicationController
  before_action :require_user_logged_in
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  
  def index
    @tasks = current_user.tasks.order(created_at: :desc).page(params[:page])
  end
  
  def show
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(task_params)
    @task = current_user.tasks.build(task_params)
    
    if @task.save
      flash[:success] = "Task が正常に追加されました"
      redirect_to @task
    else
      flash.now[:danger] = "Task が追加されませんでした"
      render :new
    end  
  end
  
  def edit
  end
  
  def update
    @task = Task.find(params[:id])
    
    if @task.update(task_params)
      flash[:success] = "Task は正常に更新されました"
      redirect_to  @task
    else
      flash.now[:danger] = "Task は更新されませんでした"
      render :edit
    end  
  end
  
  def destroy
   
    @task.destroy
    
    flash[:success] = "Task は正常に削除されました"
    redirect_to tasks_url
  end
  
  private
  
  def set_task
    @task = current_user.tasks.find_by(params[:id])
    unless @task
      redirect_to root_url
    end  
  end  
  
  def task_params
    params.require(:task).permit(:content, :status)
  end  
end
