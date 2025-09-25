class MoviesController < ApplicationController
  def index
    @sort_col = params[:sort] || 'title'
    @sort_dir = params[:dir] || 'asc'

    valid_columns = ['title', 'rating', 'release_date']
    valid_directions = ['asc', 'desc']

    @sort_col = 'title' unless valid_columns.include?(@sort_col)
    @sort_dir = 'asc' unless valid_directions.include?(@sort_dir)

    @movies = Movie.order("#{@sort_col} #{@sort_dir}")
  end

  def show
    id = params[:id]
    @movie = Movie.find(id)
  end

  def new
    @movie = Movie.new
  end

  def create
    if (@movie = Movie.create(movie_params))
      redirect_to movie_path(@movie), notice: "#{@movie.title} created"
    else
      flash[:alert] = "#{@movie.title} could not be created: " + @movies.errors.full_messages.join(",")
      render "new"
    end
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    if @movie.update movie_params
      redirect_to movie_path(@movie), notice: "#{@movie.title} updated"
    else
      flash[:alert] = "#{@movie.title} could not be created: " + @movies.errors.full_messages.join(",")
      render "edit"
    end
  end

  def destroy
    @movie = Movie.find params[:id]
    @movie.destroy
    redirect_to movies_path, notice: "#{@movie.title} deleted."
  end

  private
  def movie_params
    params.require(:movie)
    params[:movie].permit(:title, :rating, :release_date)
  end
end
