class PasswordsController < ApplicationController

    # Callback
  before_action :user_signed_in?
  before_action :find_user, only: [:edit, :update]
  before_action :authenticate_user!
#   before_action :compare_passwords, only: [:update]

  
# Action

    def edit
    end



    def update

        if @user.authenticate(params[:user][:current_password])

            # if compare_passwords?

            #     render 'edit'

            # else

                if  @user.update(password_params)
                    redirect_to root_path, notice: "Password Updated."
                else
                    render 'edit'
                end
            
            # end
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

    # def compare_passwords?
    #     @current_password = :current_password
    #     @password = :password

    #     if @current_password == @password
    #         return true
    #     else
    #         return false
    #     end
    
    # end

end
