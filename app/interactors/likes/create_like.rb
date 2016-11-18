module Likes
  class CreateLike
    include Interactor

    delegate :current_user, :article, to: :context

    def call
      like = current_user.likes.build(article: article)
      like.save ? context.like = like : context.fail!
    end
  end
end
