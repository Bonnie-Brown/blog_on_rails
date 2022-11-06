class PostsController < ApplicationController

    # Callbacks

    before_action :find_post, only: [:edit, :update, :show, :destroy]

    before_action :authenticate_user!, except: [:index, :show]

    before_action :authorize_user!, only: [:edit, :update, :destroy]

    # Actions

    # Read

    def index
        @posts = Post.order(created_at: :desc)
    end

    def show
        @comments = @post.comments.order(created_at: :desc)
        @comment = Comment.new
    end

    # Create

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        @post.user = current_user
        if @post.save
            flash[:success] = "Post successfully created."
            redirect_to @post
        else
            render 'new', status: 303
        end
    end

    # Update

    def edit
    end

    def update
        if @post.update(post_params)
            flash[:success] = "Post successfully updated."
            redirect_to @post
        else
            flash[:error] = "Something went wrong"
            render 'edit' 
        end
    end

    # Delete

    def destroy
        @post.destroy
        redirect_to root_path
    end

    private

    def find_post
        @post = Post.find(params[:id])

    end

    def post_params
        params.require(:post).permit(:title, :body)
    end

    def authorize_user!
        redirect_to root_path, alert: "Not authorized!" unless can?(:crud, @post)
    end

end
