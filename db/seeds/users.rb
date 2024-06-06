# frozen_string_literal: true

require 'faker'

ActiveRecord::Base.transaction do
  10.times do
    User.create_with(
      name: Faker::FunnyName.name,
      admin: Faker::Boolean.boolean(true_ratio: 0.2)
    ).find_or_create_by(
      email: Faker::Internet.unique.email
    )
  end
  User.create(name: 'Owner', email: ENV.fetch('OWNER_EMAIL', nil), admin: true)
end
