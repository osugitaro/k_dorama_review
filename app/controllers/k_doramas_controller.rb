class KDoramasController < ApplicationController
  before_action :authenticate_admin!, only: [:index, :new, :create, :edit, :destroy]
  before_action :set_q, only: [:top, :search]

  def top
    @user = User.new
  end

  def index
    @k_doramas = KDorama.all.page(params[:page]).per(6)
  end

  def new
    @k_dorama = KDorama.new
  end

  def create
    @k_dorama = KDorama.new(k_dorama_params)
    if @k_dorama.save
      flash[:success] = "新しくドラマを投稿しました。c"
      redirect_to k_doramas_path
    else
      flash.now[:danger] = "ドラマの投稿に失敗しました。"
      render :new
    end
  end

  def edit
    @k_dorama = KDorama.find_by(id: params[:id])
  end

  def update
    @k_dorama = KDorama.find_by(id: params[:id])
    if @k_dorama.update(k_dorama_params)
      flash[:success] = "編集しました。"
      redirect_to k_doramas_path
    else
      flash.now[:danger] = "編集に失敗しました。"
      render :edit
    end
  end

  def destroy
    @k_dorama = KDorama.find_by(id: params[:id])
    if @k_dorama.destroy
      flash[:success] = "ドラマを削除しました。"
      redirect_to k_doramas_path
    else
      flash.now[:danger] = "ドラマの削除に失敗しました。"
      render :show
    end
  end

  def show
    @k_dorama = KDorama.find(params[:id])
    @page_title = "#{@k_dorama.title} レビュー"
    @frustrations = @k_dorama.reviews.where(viewing_status: "frustration")
    @reviews = @k_dorama.reviews.page(params[:page]).per(6)
  end

  def search
    @k_doramas = @q.result(distinct: true)
    @k_doramas_rate = @k_doramas.order("rate_average DESC").page(params[:page]).per(6)
    @rate5 = @k_doramas.where(rate_average: 5.0).page(params[:page]).per(6)
    @taller_than4 = @k_doramas.where("rate_average > ?", 4.0).page(params[:page]).per(6)
  end

  private

  def set_q
    @q = KDorama.ransack(params[:q])
  end

  def admin_scan
    unless admin_signed_in?
      redirect_to root_path
    end
  end

  def k_dorama_params
    params.require(:k_dorama).permit(:title, :introduction, :image, :genre)
  end
end
