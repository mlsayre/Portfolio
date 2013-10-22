class PostPolicy < ApplicationPolicy
  attr_reader :user, :post

    def initialize(user, post)
      @user = user
      @post = post
    end

    def create?
      user.author? || user.editor? if user.present?
    end

    def update?
      user.author? || user.editor? if user.present?
    end

    def publish?
      user.editor? if user.present?
    end

    def destroy?
      if user.present?
        return true if user.editor?
        user.id == post.author_id
      end
    end

    class Scope < Struct.new(:user, :scope)
      def resolve
        if user.editor?
          scope.all
        elsif user.author?
          scope.where(author_id: user.id)
        else
          scope.where(published: true)
        end
      end
    end
end
