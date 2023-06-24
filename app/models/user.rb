class User < ApplicationRecord
  has_many :follows, dependent: :destroy
  has_many :following, through: :follows
  has_many :clock_ins, dependent: :destroy
  has_many :follow_clock_ins, through: :follows
  has_one  :current_clock_in, -> { current_clock_in }, class_name: "ClockIn", inverse_of: :user

  validates_presence_of :name

  def following_clock_ins
    includes(follows: :clock_ins).clock_ins.where
  end
end
