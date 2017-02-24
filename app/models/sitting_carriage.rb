class SittingCarriage < Carriage
  validates :sitting_seats, presence: true, numericality: { only_integer: true }
end
