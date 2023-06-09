module ReservationsHelper
  def times
    times = [
             "10:00",
             "10:30",
             "11:00",
             "11:30",
             "12:00",
             "12:30",
             "13:00",
             "13:30",
             "14:00",
             "15:00",
             "15:30",
             "16:00",
             "16:30",
             "17:00",
             "17:30",
             "18:00"
            ]
  end

  def check_reservation(reservations, day, time)
    result = false
    reservations_count = reservations.count
    # 取得した予約データにdayとtimeが一致する場合はtrue,一致しない場合はfalseを返します
    if reservations_count > 1
      reservations.each do |reservation|
        result = reservation[:day].eql?(day.strftime("%Y-%m-%d")) && reservation[:time].eql?(time)
        return result if result
      end
    elsif reservations_count == 1
      result = reservations[0][:day].eql?(day.strftime("%Y-%m-%d")) && reservations[0][:time].eql?(time)
      return result if result
    end
    return result
  end

  def is_reservable_schedule?(schedules, day, time)
    select_day = schedules.where(day: day)
    select_day_count = select_day.count
    if (select_day_count >= 1)
      Time.parse(time).between?(Time.parse(select_day[0].start_time.strftime("%H:%M").to_s), Time.parse(select_day[0].end_time.strftime("%H:%M").to_s))
    end
  end

  def check_date_before_today(day)
    day < Date.today
  end

  def check_saturday(day, time)
    if day == "土"
      !Time.parse(time).between?(Time.parse("11:00"), Time.parse("15:00"))
    end
  end

  def check_sunday(day)
    day == "日"
  end
end
