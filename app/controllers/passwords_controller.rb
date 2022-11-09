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
                    redirect_to root_path
                    flash[:success] = "Password successfully updated."
                else
                    redirect_to password_path, alert: "New password cannot match the current one. Please try again."
                end
            else
                redirect_to password_path, alert: 'Incorrect password.'
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
