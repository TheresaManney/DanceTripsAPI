class Competition < ApplicationRecord
  belongs_to :trip

  validates :trip_id, presence: true
  validates :level, presence: true
  # validates :type, presence: true
end
