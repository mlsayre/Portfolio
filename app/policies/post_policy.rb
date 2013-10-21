class PostPolicy < ApplicationPolicy
  class PostPolicy < Struct.new(:user, :post)
    def initialize(user, post)
      @user = user
      @post = post
    end

    def create?
      user.author? or not post.published?
      user.editor? or not post.published?
    end
  end
end
