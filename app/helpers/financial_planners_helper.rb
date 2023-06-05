module FinancialPlannersHelper
  def find_user(user_id)
    @user_id = User.find_by(id: user_id)
  end

  def check_calendar_day(schedules, calendar_day)
    schedules.filter_map do |schedule|
      if schedule[:day].eql?(calendar_day.strftime("%Y-%m-%d"))
        {day: schedule[:day], time: schedule[:time], user_id: schedule[:user_id]}
      end
    end
  end
end
