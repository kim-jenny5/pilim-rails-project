class ListsController < ApplicationController
    def index
        if params[:search]
            @lists = List.where("title LIKE ?", "%#{params[:search]}%")
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

    def show
        @list = List.find_by_id(params[:id])
    end

    private

    
end
