class PasswordsController < ApplicationController

    # Callback
  before_action :user_signed_in?
  before_action :find_user, only: [:edit, :update]
  before_action :authenticate_user!

  
# Action

    def edit
    end

    def update

        update_input = password_params

       

            if @user.authenticate(update_input[:current_password])
                if update_input[:current_password] != update_input[:new_password]
                    @user.update(password: update_input[:new_password])
                    redirect_to root_path, notice: "Password Updated."
                else
                    redirect_to password_path, notice: " Passwords can't match"
                end
            else
                redirect_to password_path, notice: 'You are not authorized'
            end
    end

    private

    def find_user
    
     @user = @current_user

    end

    def password_params

        puts params
        params.require(:user).permit(:current_password, :new_password, :new_password_confirmation)
    
    end

end
