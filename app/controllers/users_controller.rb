class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:edit, :update]

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end  # ここで update メソッド終了

  def show
    @user = User.find(params[:id])
    @prototypes = @user.prototypes
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: "ユーザーが見つかりませんでした"
  end


  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end

