class UsersController < ApplicationController
  before_action :set_user, only:[:show, :edit, :update]
  before_action :ensure_current_user,only:[:edit, :update]
  def index
    @user = User.all
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end
  def show
  end
  def edit
  end
  def update
    if @user.update(user_params)
      redirect_to user_path, notice: "会員情報を変更しました。"
    else
      render :edit
    end
  end
  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation,:image)
  end
  def set_user
    @user = User.find(params[:id])
  end
end
