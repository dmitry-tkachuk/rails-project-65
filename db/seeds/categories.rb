# frozen_string_literal: true

require 'faker'

ActiveRecord::Base.transaction do
  8.times do
    Category.find_or_create_by(
      name: Faker::Commerce.unique.department(max: 4)
    )
  end
end
