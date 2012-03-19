require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TodosController do
  
  describe "GET /todos/search/:filter_type" do

    it "should load have _late_ filter type" do
      get :index, :filter_type  => :late, :format => :json
      response.should be_success
    end
    
    it "should load have _uncompleted_ filter type" do
      get :index, :filter_type  => :uncompleted, :format => :json
      response.should be_success
    end
    
    it "should setup the correct options for the _late_ filter" do
      Timecop.freeze(Time.now) do
        Todo.should_receive(:sort).with(:name).and_return(Todo)
        Todo.should_receive(:where).with({:deadline => { '$lt' => Time.now}, :done => false}).and_return(Todo)
        get :index, :filter_type  => :late, :format => :json
        response.should be_success
      end
    end
    
    it "should setup the correct options for the _uncompleted_ filter" do
      Timecop.freeze(Time.now) do
        Todo.should_receive(:sort).with(:name).and_return(Todo)
        Todo.should_receive(:where).with({:done => false}).and_return(Todo)
        get :index, :filter_type  => :uncompleted, :format => :json
        response.should be_success
      end
    end
    
  end

end