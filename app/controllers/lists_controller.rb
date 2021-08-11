class ListsController < ApplicationController
    before_action :require_login, except: [:index, :show]
    # include ApplicationHelper

    def index
        if params[:search]
            @lists = List.list_search(params[:search])
            if @lists.blank?
                flash[:message] = "Sorry. 😅 There's no such list."
                redirect_to lists_path
            end
        else
            @lists = List.all
        end
    end

    def new
        @list = List.new
    end

    def create
        @list = List.new(list_params)

        if @list.save
            redirect_to list_path(@list)
        else
            render :new
        end
    end

    def show
        @list = List.find_by_id(params[:id])
        
        if params[:search]
            @movies = Movie.movie_search(params[:search])
            @movies.blank? ? flash[:message] = "'#{params[:search]}' not found." : flash[:message] = nil
            render :show
        end
    end

    def edit
        @list = List.find_by_id(params[:id])
    end

    def update
        @list = List.find_by_id(params[:id])
        if @list.valid?
            @list.update(list_params)
            redirect_to list_path(@list)
        end
    end

    def destroy
        @list = List.find_by_id(params[:id])
        @list.destroy
        redirect_to user_path(@list.user)
    end

    def add_movie
        @list = List.find_by_id(params[:list_id])
        @movie = Movie.find_by_id(params[:movie_id])
        @list.movies << @movie
        redirect_to list_path(@list)
    end

    def delete_movie
        @list = List.find_by_id(params[:list_id])
        @movie = Movie.find_by_id(params[:movie_id])
        @list.movies.delete(@movie)
        redirect_to list_path(@list)
    end

    private

    def list_params
        params.require(:list).permit(:title, :description).merge(user_id: current_user.id)
    end
end
