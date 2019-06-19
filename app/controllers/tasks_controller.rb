class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

	def index
    @tasks = Task.all.order(created_at: "DESC")
    @tasks = Task.all.order(limit: "ASC") if params[:"ニャホニャホ"].present?
	end

  def new
  	@task = Task.new
	end
	
  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, notice:"仕事を登録しました！！"
    else
      render "new"
    end
	end

	def show
  end
  
  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: "仕事を編集しました！"
    else
      render 'edit'
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice:"仕事を削除しました！"
  end

	private

	def task_params
		params.require(:task).permit(:title,:content,:limit,:status,:priority)
  end
  
  def set_task
    @task = Task.find(params[:id])
  end
end
