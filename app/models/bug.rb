class Bug < ApplicationRecord

  enum bug_type: {feature: 0, bug: 1}
  enum bug_status: { new_bug: 0, started: 1, resolved: 2, completed: 3 }


  belongs_to :project
  belongs_to :qa, class_name: 'User', optional: false
  belongs_to :developer, class_name: 'User', optional: true

  validates :bug_type, :bug_status, presence: true
  validate :is_qa
  validates :title, presence: true, uniqueness: { case_sensitive: false }
  
  before_update :is_developer_against_project

  validates :bug_status, inclusion: { in: %w(new started completed),
  message: "%{value} is reserved." }, if: -> {self.bug_type == "feature"}

  validates :bug_status, inclusion: { in: %w(new started resolved),
  message: "%{value} is reserved." }, if: -> {self.bug_type == "bug"}

  
  # image validation
  has_attached_file :avatar, default_url: "/images/:style/missing.png", validate_media_type: false
  validates_attachment_content_type :avatar, content_type: ["image/jpeg", "image/gif"]
  Paperclip.options[:content_type_mappings] = { jpg: "image/jpeg" }
  validates_with AttachmentSizeValidator, attributes: :avatar, less_than: 5.megabytes

  def is_qa
    if !self.qa.qa?
      self.errors.add(:qa, "only qa will create bugs!")
    end
  end

  def is_developer_against_project
    if self.project.developers && self.project.developers.ids.include?(self.developer_id)
    else
      self.errors.add(:developer_id, "you are not able to solve this bug !")
    end
  end
end
