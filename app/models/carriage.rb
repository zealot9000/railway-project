class Carriage < ActiveRecord::Base
  belongs_to :train

  validates :number, :top_seats, :bottom_seats, presence: true
end
