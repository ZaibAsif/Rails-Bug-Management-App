class Project < ApplicationRecord
	has_many :developer_projects
	has_many :developers, through: :developer_projects
	belongs_to :manager, class_name: 'User', foreign_key: 'manager_id'
	has_many :bugs, dependent: :destroy
	validate :is_manager
	validates :name, presence: true
	def is_manager
		if self.manager && !self.manager.manager?
			self.errors.add(:manager, "Only manager can be assigned as manager!")
		end
	end
end
