class UsersController < ApplicationController
  before_action :set_users, only: [:show,:edit,:update,:destroy]
  def index
    @users = User.all
  end
  def show
   @user = User.find(params[:id])
  end
  def new
  @user =User.new
  end
  def edit
  @user = User.find(params[:id])
  end
def create
@user = User.new(user_params)
if @user.save
  redirect_to @user, notice:"user Was successfully created"
else
  render :new
end
end
def update
if @user.update(user_params)
  redirect_to @user, notice:"was successfully updated"
else
  render :edit
end
end
def destroy
  @user= User.find(params[:id])
@user.destroy
redirect_to users_url, notice:"user was deleted succesfully"
end
private

def set_users
@user=User.find(params[:id])
end

def user_params
params.require(:user).permit(:name,:email)
end
end
