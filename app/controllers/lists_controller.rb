class ListsController < ApplicationController
    before_action :require_login, except: [:index, :show]
    before_action :find_list, except: [:index, :new, :create]
    before_action :not_authorized, only: [:edit, :update, :destroy]

    def index
        if params[:search]
            @lists = List.list_search(params[:search])
            if @lists.blank?
                flash[:message] = "Sorry. There's no such list."
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
        if params[:search]
            @movies = Movie.movie_search(params[:search])
            @movies.blank? ? flash[:message] = "'#{params[:search]}' is not found." : flash[:message] = nil
            render :show
        end
    end

    def edit
    end

    def update
        if @list.valid?
            @list.update(list_params)
            redirect_to list_path(@list)
        end
    end

    def destroy
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

    def find_list
        @list = List.find_by_id(params[:id])
    end

    def not_authorized
        if @list.user != current_user
            flash[:error] = "Sorry. You are not authorized to access this page."
            redirect_to list_path(@list)
        end
    end
end
