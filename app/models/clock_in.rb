class ClockIn < ApplicationRecord
  belongs_to :user
  belongs_to :follow, primary_key: 'followed_id', foreign_key: 'user_id'

  scope :current_clock_in, -> {
    where(wake_time: nil)
  }

  scope :last_week_clock_ins, -> {
    select('clock_ins.*, (clock_ins.wake_time - clock_ins.sleep_time) as sleep_duration')
    .where(created_at: (Date.today - 1.week).beginning_of_week.beginning_of_day..(Date.today - 1.week).end_of_week.end_of_day)
    .where.not(wake_time: nil)
    .order("sleep_duration desc")
  }

  def sleep_duration_in_hour
    ((self.wake_time - self.sleep_time) / 1.hour).round
  end

  def formated_wake_time
    self.wake_time.strftime("%d of %B, %Y - %I:%M %p")
  end

  def formated_sleep_time
    self.sleep_time.strftime("%d of %B, %Y - %I:%M %p")
  end
end