class ListsController < ApplicationController
  before_action :set_list, only: %I[show]

  def index
    @lists = List.all
  end

  def show
    # display all film in the list
    @bookmarks = @list.bookmarks
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    # No need for app/views/lists/create.html.erb
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

  def set_list
    @list = List.find(params[:id])
  end
end
