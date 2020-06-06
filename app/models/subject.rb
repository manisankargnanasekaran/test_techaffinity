class Subject < ApplicationRecord
  belongs_to :user
  #validates :subject_name, :subject_code, :presence => true
  validates_presence_of :subject_name, :subject_code, :user_id, message: "Required"
  validates :subject_name, :subject_code, :user_id, uniqueness: {message: "already Registered"}
end
