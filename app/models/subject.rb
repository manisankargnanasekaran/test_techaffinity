class Subject < ApplicationRecord
  belongs_to :user
  validates :subject_name, :subject_code, :presence => true
  validates :subject_name, :subject_code, :user_id, uniqueness: true
end
