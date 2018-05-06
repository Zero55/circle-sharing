# frozen_string_literal: true

module PostsHelper
  def empty_posts(posts)
    'Hmm... seems like there are no posts on your feed' if posts.blank?
  end

  def post_seen_class(post)
    return 'seen' if post.seen?
    ''
  end
end
