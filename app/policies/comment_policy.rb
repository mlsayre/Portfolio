class CommentPolicy < ApplicationPolicy
  attr_reader :user, :comment

    def initialize(user, comment)
      @user = user
      @comment = comment
    end

    def update?
      user.author? || user.editor? if user.present?
    end

    def approve?
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
          scope.where(approved: true)
        end
      end
    end
end
