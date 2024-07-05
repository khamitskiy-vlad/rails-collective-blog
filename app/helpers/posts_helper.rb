# frozen_string_literal: true

module PostsHelper
  def locale_category_from(post)
    if I18n.locale == I18n.default_locale
      post.category.name
    else
      post.category.route.capitalize
    end
  end
end
