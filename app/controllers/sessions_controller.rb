class SessionsController < ApplicationController

    def new
    end


    def create
        @user = User.find_by_email params[:email]
        
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to root_path, {notice: "Logged in"}
        else
            redirect_to new_session_path, {notice: "Wrong email or password", status: 303} 
        end
    end


    def destroy
        session[:user_id] = nil
        {notice: "Logged out"}
        redirect_to root_path
    end


end
