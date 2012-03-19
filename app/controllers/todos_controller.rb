class TodosController < ApplicationController
  respond_to :json, :html

  def index
    @todos = (params[:filter_type] && Todo.respond_to?(params[:filter_type]) ? Todo.send(params[:filter_type]).all : Todo.sort(:name).all)
    respond_with @todos 
  end

  def create
    todo_attributes = params[:todo]
    todo_attributes[:deadline] = Time.parse(params[:todo][:deadline])
    @todo = Todo.new(todo_attributes)
    respond_to do |format|
      if @todo.save
        format.html { redirect_to @todo, notice: 'Todo was successfully created.' }
        format.json { render json: @todo, status: :created, location: @todo }
      else
        format.html { render action: "new" }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @todo = Todo.find(params[:id])

    respond_to do |format|
      if @todo.update_attributes(params[:todo])
        format.html { redirect_to @todo, notice: 'Todo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy

    respond_to do |format|
      format.html { redirect_to todos_url }
      format.json { head :no_content }
    end
  end
end
