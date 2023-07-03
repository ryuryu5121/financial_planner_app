module FinancialPlannersHelper
  def find_user(user_id)
    @user_id = User.find_by(id: user_id)
  end

  #日付とFinancial_Plannerの勤務可能時間帯を比較する
  def check_calendar_day(schedules, calendar_day)
    schedules.filter_map do |schedule|
      if schedule[:day].eql?(calendar_day.strftime("%Y-%m-%d"))
        {day: schedule[:day], time: schedule[:time], user_id: schedule[:user_id]}
      end
    end
  end

  def is_reservable_schedule?(schedules, day, time)
    select_day = schedules.where(day: day)
    select_day_count = select_day.count
    if (select_day_count == 1)
      Time.parse(time).between?(Time.parse(select_day[0].start_time.strftime("%H:%M").to_s), Time.parse(select_day[0].end_time.strftime("%H:%M").to_s))
    end
  end
end
