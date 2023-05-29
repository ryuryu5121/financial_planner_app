class Schedule < ApplicationRecord
  validates :start_time, presence: true
  validate :start_time, :date_cannot_be_before_start_time
  validates :end_time, presence: true, comparison: { greater_than: :start_time }
  validates :day, presence: true

  private

  def date_cannot_be_before_start_time
    if start_time >= end_time
      errors.add(:date, "開始時刻、または終了時刻が間違っています")
    end
  end

end
