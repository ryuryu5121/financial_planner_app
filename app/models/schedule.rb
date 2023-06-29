class Schedule < ApplicationRecord
  validates :end_time, presence: true, comparison: { greater_than: :start_time }
  validates :start_time, presence: true
  validate :start_time, :date_cannot_be_before_start_time
  validates :day, presence: true
  validate :day, :day_cannot_be_before_today
  validate :start_time, :start_time_can_be_every_thirty_minutes
  validate :end_time, :end_time_can_be_every_thirty_minutes

  private

  def date_cannot_be_before_start_time
    if start_time >= end_time
      errors.add(:date, "は終了時刻より前の時間に設定してください")
    end
  end

  def day_cannot_be_before_today
    if day <= Date.today
      errors.add(:day, "に誤りがあります。本日より先の日程でご登録をお願いします")
    end
  end

  def self.financial_planner_schedule(financial_planners_id)
    Schedule.all.where(FP_id: financial_planners_id)
  end

  def start_time_can_be_every_thirty_minutes
    if start_time.min != 0 && start_time.min != 30
      errors.add(:start_time, "に誤りがあります。適切な時刻を入力してください")
    end
  end

  def end_time_can_be_every_thirty_minutes
    if end_time.min != 0 && end_time.min != 30
      errors.add(:end_time, "に誤りがあります。適切な時刻を入力してください")
    end
  end
end
