class PasswordsController < ApplicationController

    # Callback
  before_action :user_signed_in?
  before_action :find_user, only: [:edit, :update]
  before_action :authenticate_user!

  
# Action

    def edit
    end



    def update

        if  @user.update(password_params)
            redirect_to root_path, notice: "Password Updated."
        else
            render 'edit'
        end
    end

    private

    def find_user
    
    @user = @current_user

    end

    def password_params
        params.require(:user).permit(:password, :password_confirmation)
    end
end
