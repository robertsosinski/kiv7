class Api::V1::TasksController < Api::V1::VersionController
  before_filter :check_authentication
  
  def index
    @tasks = warden.user.tasks.order('id asc')
  end
  
  def create
    @task = warden.user.tasks.create(params[:task])
    
    if @task.save
      render :json => @task, :status => 201
    else
      render :json => {:errors => @task.errors}, :status => 422
    end
  end
  
  def toggle
    @task = warden.user.tasks.find(params[:id])
    @task.toggle
    
    render :json => {:done => @task.done}
  end
  
  def update
    @task = warden.user.tasks.find(params[:id])
    @task.name = params[:task][:name]
    
    if @task.save
      render :json => @task, :status => 201
    else
      render :json => {:errors => @task.errors}, :status => 422
    end
  end
  
  def destroy
    @task = warden.user.tasks.find(params[:id])
    @task.destroy
    
    render :json => {:destroyed => true}
  end
end
