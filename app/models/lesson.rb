class Lesson < ApplicationRecord

  validates :day, presence: true, numericality: { only_integer: true, less_than: 32 }
  validates :month, presence: true, numericality: { only_integer: true, less_than: 13 }
  validates :year, presence: true, numericality: { only_integer: true }

  validates :student, presence: true
  validates :location, presence: true

  validates :income, presence: true,  numericality: { only_integer: true }
  validates :fnb, presence: true, numericality: { only_integer: true }
  validates :transport, presence: true, numericality: { only_integer: true }

  validates :duration, presence: true, numericality: { only_integer: true }
end
