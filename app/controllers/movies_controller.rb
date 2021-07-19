class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
    @actors = @movie.actors.sort_by_age
    @avg_age = @movie.actors.average_age
  end
end
