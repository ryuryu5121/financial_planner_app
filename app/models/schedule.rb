class Schedule < ApplicationRecord
  validates :end_time, presence: true, comparison: { greater_than: :start_time }
  validates :start_time, presence: true
  validate :start_time, :date_cannot_be_before_start_time
  validates :day, presence: true
  validate :day, :day_cannot_be_before_today

  private

  def date_cannot_be_before_start_time
    if start_time >= end_time
      errors.add(:date, "開始時刻は終了時刻以前に設定してください")
    end
  end
  def day_cannot_be_before_today
    if day <= Date.zone.today
      errors.add(:day, "ご指定の日程では予約できません。本日より先の日程にご予約ください")
    end
  end
end
