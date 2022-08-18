class BookmarksController < ApplicationController
  before_action :set_list, only: %i[new create]

  def new
    @bookmark = Bookmark.new
  end

  # <select class="form-select is-invalid select required" aria-invalid="true"
  # name="bookmark[movie_id]" id="bookmark_movie_id"><option value="" label=" "></option>
  # <option value="1">Whiplash</option>
  # <option value="2">The Grapes of Wrath</option>
  # <option value="3">Sunset Blvd.</option>
  # <option value="4">The Sting</option>
  # <option value="5">Toy Story 3</option>
  # <option value="6">Goodfellas</option>
  # <option value="7">WALL·E</option>
  # <option value="8">Titanic</option>
  # <option value="9">Ocean's Eight</option></select>

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    # @bookmark.comment = params[:bookmark][:comment]
    # @bookmark.movie_id = params[:bookmark][:movie_id]
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @list = @bookmark.list_id
    @bookmark.destroy
    # @task.destroy
    # No need for app/views/tasks/delete.html.erb
    redirect_to list_path(@list)
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list)
  end
end
