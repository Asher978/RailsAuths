class MonstersController < ApplicationController

    before_action :ensure_logged_in

    def new 
        @monster = Monster.new
    end

    def create 
        @monster = Montser.new(create_params)
        @monster.user = current_user
        
            if @monster.save
              flash[:notice] = 'Monster created!'
              redirect_to monster_path(@monster)
            else
              flash[:error] = @monster.errors.full_messages.join(', ')
              render :new
            end
    end

    private
    
    def create_params
        params.require(:monster).permit(:name, :description)
    end
end
