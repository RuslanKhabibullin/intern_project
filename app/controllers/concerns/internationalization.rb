module Internationalization
  extend ActiveSupport::Concern

  included do
    before_action :set_locale
  end

  private

  def set_locale
    I18n.locale = user_signed_in? ? current_user.locale : header_locale
  end

  def header_locale
    http_accept_language.compatible_language_from(I18n.available_locales)
  end
end
