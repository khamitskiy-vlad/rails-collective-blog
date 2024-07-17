# frozen_string_literal: true

module PostsHelper
  def localed_column
    return :name if I18n.locale == I18n.default_locale

    :route
  end
end
