class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_uniqueness_of :email
  has_many :developer_projects, foreign_key: :developer_id
  has_many :projects, through: :developer_projects
  has_many :manager_projects, foreign_key: :manager_id, class_name: 'Project'
  has_many :bugs, foreign_key: :qa_id, class_name: 'Bug'
  has_many :solved_bugs, foreign_key: :developer_id, class_name: 'Bug'
  enum user_type: {manager: 0, developer: 1, qa: 2}

  validates :user_type, :email, :name, presence: true
end