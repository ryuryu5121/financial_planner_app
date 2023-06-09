class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @status = params[:status]
    @user_future_reservations = Reservation.where(user_id: current_user.id).where(day: (Date.current)..(Date.current.since(3.month)))
    @user_finished_reservations = Reservation.where(user_id: current_user.id).where("day < ?", Date.current)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.account_activation(@user).deliver_now
      flash[:info] = "登録されたメールアドレスをご確認ください"
      redirect_to root_url
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
