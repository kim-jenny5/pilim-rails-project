class ListsController < ApplicationController
    def index
        @lists = List.all
        # @movies = Movie.where('title LIKE ?', "%#{params[:search]}%")

    end

    def show
        @list = List.find_by_id(params[:id])
    end
end
