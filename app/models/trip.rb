class Trip < ApplicationRecord
  has_many :competitions
  belongs_to :traveler

  # validates :traveler_id, presence: true
  # validates :location, presence: true
  # validates :start_date, presence: true
  # validates :end_date, presence: true

end
