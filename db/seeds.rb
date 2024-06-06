# frozen_string_literal: true

Rails.logger.info '###############'
Rails.logger.info 'Seeding started'

require_relative 'seeds/users'
require_relative 'seeds/categories'
require_relative 'seeds/bulletins'

Rails.logger.info 'Seeding stopped'
Rails.logger.info '###############'
