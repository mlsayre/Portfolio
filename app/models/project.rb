class Project < ActiveRecord::Base
  attr_accessible :name, :short_desc, :long_desc, :projectpic_url
  validates :projectpic_url, presence: true
  validates :name, length: { in: 4..255 }
  has_many :comments, as: :commentable
end
