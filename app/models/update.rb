class Update < ApplicationRecord
  belongs_to :extension
  validates_uniqueness_of :version
  scope :only_majors, -> { where(major: true) }
  scope :unreviewed, -> { where(reviewed: false) }
end
