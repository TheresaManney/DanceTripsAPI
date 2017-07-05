class Competition < ApplicationRecord
  belongs_to :trip

  validates :trip_id, presence: true
  validates :level, presence: true
  validates :comp_type, presence: true
end
