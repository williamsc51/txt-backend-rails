class UsersController < ApplicationController
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new()
  end

  def create
    @user = User.new(user_params)

    if @user.save
      UserMailer.with(user: @user).welcome_email.deliver_now
      flash[:notice] = "User successfully added"
      redirect_to(users_path)
    else
      render('new')
    end

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      flash[:notice] = "User successfully updated"
      redirect_to(user_path(@user))
    else
      render('edit')
    end
  end

  def delete
  end

  def destroy
  end

  private

   def user_params
    params.require(:user).permit(:fname, :lname, :email, :password)
  end


end
