class EconomyCarriage < Carriage
  validates :side_top_seats, :side_bottom_seats, :top_seats, :bottom_seats, presence: true, numericality: { only_integer: true }
end
