class MovieFromTmdbController < ApplicationController
    def index
        Tmdb::Api.key("1800a69a4e84911cbb0d843dea9ed085")
        Tmdb::Api.language("de")
        @search = Tmdb::Search.new
        @search.resource('movie') # determines type of resource
        @search.query(params[:search]) # the query to search against
        @movie_list = @search.fetch
        if (@movie_list)
          return @movie_list
        else
          return @movie_list = []
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
          @movie_list
        else
          @movie_list = []
        end
    end
end
