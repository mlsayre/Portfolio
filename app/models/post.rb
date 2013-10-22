class Post < ActiveRecord::Base
  attr_accessible :content, :title, :published
  belongs_to :author, class_name: "User"
  has_many :comments
end
