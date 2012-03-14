class Api::V1::TasksController < Api::V1::VersionController
  def index
    @tasks = Task.all
  end
end
