class PostsController < ApplicationController

    def index
    end

    def show
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
    end

    def destroy
    end

    private

    def post_params
        params.require(:post).permit(:title, :body)
    end

end
