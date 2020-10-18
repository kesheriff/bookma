class MoviesController < ApplicationController
    before_action :set_movie, only: [:show, :edit, :update, :destroy]
    
    def home
    end
    def index
        @movies = Movie.all
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
            #redirect_to movies_path(@movie), :notice => "Movie was successfully created."
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
            render "show"
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
