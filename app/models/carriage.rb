class Carriage < ActiveRecord::Base
  validates :number, uniqueness: { scope: :train_id }
  before_validation :set_number

  belongs_to :train

  scope :coupe,             -> { where(type: 'CoupeCarriage') }
  scope :economy,           -> { where(type: 'EconomyCarriage') }
  scope :sitting,           -> { where(type: 'SittingCarriage') }
  scope :comfortable,       -> { where(type: 'ComfortableCarriage') }
  scope :total_top,         -> { sum(:top_seats) }
  scope :total_bottom,      -> { sum(:bottom_seats) }
  scope :total_sitting,     -> { sum(:sitting_seats) }
  scope :total_side_top,    -> { sum(:side_top_seats) }
  scope :total_side_bottom, -> { sum(:side_bottom_seats) }

  scope :ordered, ->(order) { order(number: order ? 'asc' : 'desc') }

  private

  def set_number
    return unless train.present?
    self.number = train.carriages.size + 1
  end
end
