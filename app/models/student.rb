class Student < ApplicationRecord
	has_many :reports
	has_many :subjects
	validates_presence_of :name, :roll_no, message: "Required"
    validates :name, :roll_no, uniqueness: {message: "already Registered"}
end
