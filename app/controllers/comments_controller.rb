class CommentsController < ApplicationController
  def create
    @review = Review.find(params[:review_id])
    @comments = @review.comments
    @comment = @review.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment_reply = @review.comments.new
    if @comment.save
      flash[:success] = "コメントの投稿に成功しました。"
      redirect_to review_path(@review)
    else
      flash.now[:danger] = "コメントの投稿に失敗しました"
      render template: "reviews/show"
    end
  end

  def destroy
    @review = Review.find(params[:review_id])
    @review_reply = @review.comments.new

    @comment = Comment.find(params[:id])
    if @comment.destroy
      flash[:success] = "コメントの削除に成功しました。"
      redirect_to review_path(@review)
    else
      flash[:danger] = "コメントの削除に失敗しました"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :user_id, :review_id, :parent_id)
  end
end
