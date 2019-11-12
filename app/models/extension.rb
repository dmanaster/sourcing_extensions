class Extension < ApplicationRecord
  has_many :updates, :dependent => :destroy
  validates :name, :presence => true
  validates :url, :presence => true
end
