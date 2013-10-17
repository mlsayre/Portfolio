class Post < ActiveRecord::Base
  attr_accessible :content, :title
  belongs_to :author, class_name: "User"
end
