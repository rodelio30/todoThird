class TodoItemsController < ApplicationController
  before_action :set_todo_list
  before_action :set_todo_item, except: [:create]

  def create
    @todo_item = @todo_list.todo_items.create(todo_item_param)
    redirect_to @todo_list
  end

  def destroy
    if @todo_item.destroy
      flash[:success] = "todo Item was Deleted"
    else
      flash[:error] = "Todo Item could not be deleted"
    end
    redirect_to @todo_list
  end
private
 def set_todo_list
   @todo_list = TodoList.find(params[:todo_list_id])
 end

 def set_todo_item
   @todo_item = @todo_list.todo_items.find(params[:id])
 end

 def todo_item_param
   params[:todo_item].permit(:content)
 end

end
