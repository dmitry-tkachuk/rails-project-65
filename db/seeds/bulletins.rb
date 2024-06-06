# frozen_string_literal: true

require 'faker'

ActiveRecord::Base.transaction do
  users = User.all
  categories = Category.all

  states = %i[draft archived published rejected under_moderation]

  raise 'No users or categories available for creating bulletins' if users.empty? || categories.empty?

  100.times do
    bulletin = Bulletin.new(
      title: Faker::Commerce.product_name,
      description: Faker::Fantasy::Tolkien.poem,
      category: categories.sample,
      user: users.sample,
      state: states.sample
    )
    file_number = rand(1..5)
    filepath = Rails.root.join("test/fixtures/files/bulletin_#{file_number}.jpg").to_s

    raise "Image file not found: #{filepath}" unless File.exist?(filepath)

    bulletin.image.attach(io: File.open(filepath), filename: "bulletin_#{file_number}.jpg", content_type: 'image/jpg')

    if bulletin.save
      Rails.logger.debug { "Bulletin #{bulletin.title} created successfully." }
    else
      Rails.logger.debug { "Failed to create bulletin #{bulletin.title}." }
    end
  end
end
