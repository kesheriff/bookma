class MoviesController < ApplicationController
    before_action :set_movie, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, except:[:index,:show]
    

    def index
        @movies = Movie.order(:title).order(:release_date)
    end

    def show
        @reviews = Review.where(movie_id: @movie.id).order("created_at DESC")
        
    end

    def new
        @movie = current_user.movies.build
    end

    def create
        @movie = current_user.movies.build(movie_params)
          if @movie.save
            render "show" 
          else
            render "new"
          end
        
    end

    def edit
        @movies = Movie.find(params[:id])
    end

    def update
          if @movie.update(movie_params)
            redirect_to movies_path
          else
            render "edit"
          end
        
    end

    def destroy
        @movie = Movie.find(params[:id])
        @movie.destroy
        redirect_to movies_path, :notice => "Movie was successfully destroyed."
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def movie_params
      params.require(:movie).permit(:title, :rating, :description, :release_date)
    end
end
