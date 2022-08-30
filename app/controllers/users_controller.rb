class UsersController < ApplicationController
  before_action :find_user, only: [:show , :destroy , :update, :edit]
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user= User.new(user_params)
    if @user.save
      redirect_to @user
    else 
      render 'new'
    end
  end

  def show; end

  def destroy
    @user.destroy
    redirect_to users_path
  end
  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end
  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name , :email)
  end  
end
