class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all.where(day: (Date.current)..(Date.current.since(3.month))).where(fp_id: params[:fp_id]).order(day: :desc)
    @financial_planners ||= FinancialPlanner.all
    @choice_fp = params[:fp_id]
    @select_fp_schedules = Schedule.all.where(day: (Date.current)..(Date.current.since(3.month))).where(FP_id: params[:fp_id]).order(day: :desc)
  end

  def new
    @reservation = Reservation.new
    @fp_id = FinancialPlanner.find_by(id: params[:fp_id])
    @day = params[:day]
    @time = params[:time]
    @start_time = DateTime.parse(@day + " " + @time + " " + "JST")
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to reservation_path @reservation.id
    else
      render :new
    end
  end

  private
  def reservation_params
    params.require(:reservation).permit(:day, :time, :user_id, :start_time, :fp_id)
  end
end
