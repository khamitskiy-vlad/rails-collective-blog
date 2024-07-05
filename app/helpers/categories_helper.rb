# frozen_string_literal: true

module CategoriesHelper
  def locale(category)
    if I18n.locale == I18n.default_locale
      category.name
    else
      category.route.capitalize
    end
  end
end
