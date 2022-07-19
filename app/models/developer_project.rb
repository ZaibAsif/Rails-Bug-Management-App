class DeveloperProject < ApplicationRecord
	belongs_to :project
	belongs_to :developer, foreign_key: :developer_id, class_name: :User
	before_create :is_developer
	
	def is_developer
		if !self.developer.developer?
			self.errors.add(:developer, "Only developer can be assigned as developer!")
		end
	end
end