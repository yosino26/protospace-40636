class UsersController < ApplicationController
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
    @user = User.find_by(id: params[:id])
    if @user.nil?
      redirect_to root_path, alert: "ユーザーが見つかりませんでした"
    else
      @prototypes = @user.prototypes
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end

