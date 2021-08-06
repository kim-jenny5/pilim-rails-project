class ListsController < ApplicationController
    def index
        if params[:search]
            # @lists = List.where("title LIKE ?", "%#{params[:search]}%")
            @lists = List.joins(:lists_movies).joins(:movies).where("lists.title LIKE :term OR movies.title LIKE :term", term: "%#{params[:search]}%").distinct #move to model for a scope
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
        @list = current_user.lists.build(list_params)

        if @list.save
            redirect_to list_path(@list)
        else
            render :new
        end
    end

    def show
        @list = List.find_by_id(params[:id])
    end

    def destroy
        @list = List.find_by_id(params[:id])
        @list.destroy
        redirect_to user_path(@list.user)
    end

    private

    def list_params
        params.require(:list).permit(:title, :description)
    end
end
