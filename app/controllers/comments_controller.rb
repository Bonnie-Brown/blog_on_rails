class CommentsController < ApplicationController

    before_action :find_post


    def create
        @comment = Comment.new(comment_params)
        @comment.post = @post 
        if @comment.save
            flash[:success] = "Comment successfully created!"
            redirect_to @post
        else
            flash[:error] = "Something went wrong"
            @comments = @post.comment.order(created_at: :desc)
            render "/posts/show"
        end
    end

    def destroy
        @comment = comment.find params[:id]
        @comment.destroy
        flash[:success] = "Comment has been deleted."
        redirect_to @post 
    end

    private

    def find_post
        @post= Post.find params[:post_id]
    end

    def comment_params
        params.require(:comment).permit(:body)
    end


end
