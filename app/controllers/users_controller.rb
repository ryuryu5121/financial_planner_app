class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @user_reservations = Reservation.where(user_id: current_user.id)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      reset_session
      log_in @user
      flash[:success] = "FP Appへようこそ!"
      redirect_to @user
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def find_by_fp(fp_id)
    FinancialPlanner.find_by(id: fp_id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
