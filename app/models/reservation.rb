class Reservation < ApplicationRecord
  def self.reservations_after_three_month
    # 今日から3ヶ月先までの予約情報（年月日、時間）を取得
    # reservations = Reservation.all.where("day >= ?", Date.current).where("day < ?", Date.current >> 3).order(day: :desc)
    reservations = Reservation.all.where(day: (Date.current)..(Date.current.since(3.month)))
    # DBアクセスを減らすために必要なデータを配列に保存
    reservation_data = []
    reservations.each do |reservation|
      reservations_hash = {}
      reservations_hash.merge!(day: reservation.day.strftime("%Y-%m-%d"), time: reservation.time)
      reservation_data.push(reservations_hash)
    end
    reservation_data
  end
end
