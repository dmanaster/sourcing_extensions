class Update < ApplicationRecord
  belongs_to :extension
  validates_uniqueness_of :version
end
