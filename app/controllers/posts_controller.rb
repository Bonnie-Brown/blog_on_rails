class PostsController < ApplicationController

    # Callbacks

    before_action :find_post, only: [:edit, :update, :show, :destroy]

    # Actions

    def index
        @posts = Post.order(created_at: :desc)
    end

    def show
        @comments = @post.comments.order(created_at: :desc)
        @comment = Comment.new
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            flash[:success] = "Post successfully created."
            redirect_to @post
        else
            flash[:error] = "Something went wrong"
            render 'new'
        end
    end

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

end
