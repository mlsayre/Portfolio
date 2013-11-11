class Project < ActiveRecord::Base
  attr_accessible :name, :short_desc, :long_desc, :projectpic_url, :projecturl
  validates :projectpic_url, presence: true
  validates :name, length: { in: 4..255 }
  has_many :comments, as: :commentable
end
