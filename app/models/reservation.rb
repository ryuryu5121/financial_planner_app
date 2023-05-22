class Reservation < ApplicationRecord
  def self.reservations_after_three_month
    # 今日から3ヶ月先までのデータを取得
    reservations = Reservation.all.where(day: (Date.current)..(Date.current.since(3.month)))
    # 配列を作成し、データを格納
    reservations.map do |reservation|
      {day: reservation.day.strftime("%Y-%m-%d"), time: reservation.time}
    end
  end
end
