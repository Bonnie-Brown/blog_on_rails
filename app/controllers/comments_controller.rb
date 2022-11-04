class CommentsController < ApplicationController

    before_action :find_post


    def create
        @comment = Comment.new(comment_params)
        @comment.post = @post 
        if @comment.save
            flash[:success] = "Comment successfully created!"
            redirect_to @post
        else
            @comments = @post.comments.order(created_at: :desc)
            render "/posts/show", status: 303 
        end
    end

    def destroy
        @comment = Comment.find params[:id]
        @comment.destroy
        redirect_to post_path(@comment.post)
        flash[:success] = "Comment has been deleted."
        
    end

    private

    def find_post
        @post= Post.find params[:post_id]
    end

    def comment_params
        params.require(:comment).permit(:body)
    end


end
