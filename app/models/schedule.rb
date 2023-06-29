class Schedule < ApplicationRecord
  validates :end_time, presence: true, comparison: { greater_than: :start_time }
  validates :start_time, presence: true
  validate :start_time, :date_cannot_be_before_start_time
  validates :day, presence: true
  validate :day, :day_cannot_be_before_today

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
end
