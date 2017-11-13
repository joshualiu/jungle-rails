class UsersController < ApplicationController
  
  def new 
  end

  def create

    @user = User.new(user_params)

    if User.find_by_email(user_params[:email])
      render :signup
    elsif @user.save  
      session[:user_id] = @user.id
      redirect_to '/', notice: 'Account created successfully'
    else
      render :signup 
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :firstName,
      :lastName,
      :email.downcase!,
      :password,
      :password_confirmation
    )
  end


end
