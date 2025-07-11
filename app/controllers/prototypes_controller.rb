class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path, notice: "プロトタイプを作成しました！"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # ログインユーザー以外が編集画面に来ないようにする場合
    unless @prototype.user == current_user
      redirect_to root_path, alert: "権限がありません。"
    end
  end
  
  def update
    if @prototype.update(prototype_params)
      redirect_to prototype_path(@prototype), notice: "プロトタイプを更新しました！"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  
  def show
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def destroy
      @prototype.destroy
      redirect_to root_path, notice: "プロトタイプを削除しました！"
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def move_to_index
    unless @prototype.user_id == current_user.id
      redirect_to root_path, alert: "権限がありません。"
    end
  end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  
end
