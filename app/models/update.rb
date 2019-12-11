class Update < ApplicationRecord
  belongs_to :extension
  validates_uniqueness_of :version
  scope :only_majors, -> { where(major: true).order(version: :DESC) }
  scope :unreviewed, -> { where(reviewed: false).order(version: :DESC) }
end
