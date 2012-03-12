class Api::V1::TasksController < Api::V1::VersionController
  def index
    @tasks = [{:name => "wash laundry", :done => false}, {:name => "do dishes", :done => true}]
  end
end
