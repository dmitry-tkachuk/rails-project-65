# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

ENV['RANSACK_FORM_BUILDER'] = '::SimpleForm::FormBuilder'

Bundler.require(*Rails.groups)

module RailsProject65
  class Application < Rails::Application
    config.load_defaults 7.1

    config.autoload_lib(ignore: %w[assets tasks])

    config.i18n.default_locale = :ru
  end
end
