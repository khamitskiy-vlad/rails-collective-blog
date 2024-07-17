# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend

  def resource_name
    :user
  end

  def locale_category_from(category)
    if I18n.locale == I18n.default_locale
      category.name
    else
      category.route.capitalize
    end
  end
end
