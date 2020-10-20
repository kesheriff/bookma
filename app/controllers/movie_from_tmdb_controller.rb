class MovieFromTmdbController < ApplicationController
    def index
        Tmdb::Api.key("1800a69a4e84911cbb0d843dea9ed085")
        Tmdb::Api.language("de")
        @search = Tmdb::Search.new
        @search.resource('movie') # determines type of resource
        @search.query(params[:search]) # the query to search against
        @movie_list = @search.fetch
        @list_class = Array.new
        
        if (@movie_list)
          @movie_list.each do |movie|
            @movie_test = MovieFromTmdb.new(:title => movie['original_title'],:rating => movie['vote_average'],:release_date => movie['release_date'], :description => ' ')
            @movie_test.save
            @list_class.push(@movie_test)
          end
          return @list_class
        else
          return @list_class = []
        end
    end

    def search
        Tmdb::Api.key("1800a69a4e84911cbb0d843dea9ed085")
        Tmdb::Api.language("de")
        @search = Tmdb::Search.new
         
        @search.resource('movie') # determines type of resource
        @search.query(params[:search]) # the query to search against
        @movie_list = @search.fetch
        @list_class = Array.new
        
        if (@movie_list)
          @movie_list.each do |movie|
            @movie_test = MovieFromTmdb.new(:title => movie['original_title'],:rating => movie['vote_average'],:release_date => movie['release_date'], :description => ' ')
            @movie_test.save
            @list_class.push(@movie_test)
          end
        else
          @movie_list = []
        end
    end

    def edit
      @movie_test = MovieFromTmdb.find(params[:id])
    end
    #--------------------------------------------------
    def update
      @movie_test = MovieFromTmdb.find(params[:id])
      @movie = Movie.new(:title => @movie_test.title,:rating => @movie_test.rating,:release_date => @movie_test.release_date,:description => @movie_test.description,:user_id =>current_user.id)
      if @movie.save
        redirect_to movies_path
      else 
        redirect_to movies_path
      end
      MovieFromTmdb.destroy_all
    end
end
