class ReviewsController < ApplicationController
  before_action :move_to_login, only: [:new, :create, :edit, :destroy]

  def show
    @review = Review.find(params[:id])
    @k_dorama = @review.k_dorama
    @comments = @review.comments.order(created_at: :desc)
    @comment = Comment.new
    @comment_reply = @review.comments.new
    @page_title = "k_dorama_review | 「#{@k_dorama.title}」 #{@review.user.name}のレビュー"
  end

  def new
    @review = Review.new
    @k_dorama = KDorama.find(params[:id])
    @user = current_user
  end

  def create
    @review = Review.new(review_params)
    @k_dorama = @review.k_dorama
    @user = current_user
    if @review.save
      flash[:success] = "コメントを投稿しました。"
      redirect_to k_dorama_path(@k_dorama)
    else
      flash.now[:danger] = "コメントの投稿に失敗しました。"
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
    @k_dorama = @review.k_dorama
  end

  def update
    @review = Review.find(params[:id])
    @k_dorama = @review.k_dorama
    if @review.update(review_params)
      flash[:success] = "コメントを編集しました。"
      redirect_to k_dorama_path(@review.k_dorama.id)
    else
      flash.now[:danger] = "コメントの編集に失敗しました。"
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @k_dorama = @review.k_dorama
    if @review.destroy
      flash[:success] = "コメントを削除しました。"
      redirect_to k_dorama_path(@k_dorama)
    else
      flash.now[:danger] = "コメントの削除に失敗しました。"
      render :edit
    end
  end

  private

  def review_params
    params.require(:review).permit(:impression, :k_dorama_id, :user_id, :viewing_status, :recommendation, :not_recommendation,
:evaluation)
  end

  def move_to_login
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
