class Reservation < ApplicationRecord
  def self.reservations_after_three_month
    # 今日から3ヶ月先までのデータを取得
    reservations = Reservation.all.where(day: (Date.current)..(Date.current.since(3.month)))
    # 配列を作成し、データを格納
    reservations.map do |reservation|
      { day: reservation.day.strftime("%Y-%m-%d"), time: reservation.time }
    end
  end

  def self.financial_planner_schedule(financial_planners_id)
    schedule = Schedule.all.where(FP_id: financial_planners_id)
  end

  def self.financial_planner_reservations(financial_planner_id)
    reservations = Reservation.all.where(day: (Date.current)..(Date.current.since(3.month))).where(fp_id: financial_planner_id).order(day: :desc)
    reservations.map do |reservation|
      { day: reservation.day.strftime("%Y-%m-%d"), time: reservation.time, user_id: reservation.user_id }
    end
  end
end
