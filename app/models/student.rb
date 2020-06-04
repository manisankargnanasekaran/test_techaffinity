class Student < ApplicationRecord
	has_many :reports
	has_many :subjects
end
