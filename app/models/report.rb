class Report < ApplicationRecord
  belongs_to :student
  belongs_to :subject
  validates :mark, numericality: { greater_than: -1, less_than_or_equal_to: 100 }
end
