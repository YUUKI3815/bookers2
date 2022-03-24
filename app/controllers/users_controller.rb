class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id]) 
   if @user.update(user_params)
    redirect_to user_path(@user.id)
     flash[:notice] = "User was successfully updated."
   else
    render :edit
   end
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
