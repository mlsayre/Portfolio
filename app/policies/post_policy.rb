class PostPolicy < ApplicationPolicy
  attr_reader :user, :post

    def initialize(user, post)
      @user = user
      @post = post
    end

    def create?
      if user.present?
        user.author? || user.editor?
      end
    end

    def update?
      if user.present?
        user.author? || user.editor?
      end
    end

    def publish?
      if user.present?
        user.editor?
      end
    end

    def destroy?
      if user.present?
        return true if user.editor?
        user.id == post.author_id
      end
    end

end
