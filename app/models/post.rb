class Post < ActiveRecord::Base
  attr_accessible :content, :title, :published, :created_at, :summary, :creator, :postindexpic_url, :category
  belongs_to :author, class_name: "User"
  has_many :comments, as: :commentable

  def previous_post
    self.class.first(:conditions => ["id < ?", id], :order => "id desc")
  end

  def next_post
    self.class.first(:conditions => ["id > ?", id], :order => "id asc")
  end
end
