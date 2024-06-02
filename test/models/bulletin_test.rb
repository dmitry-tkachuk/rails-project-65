# frozen_string_literal: true

require 'test_helper'

class BulletinTest < ActiveSupport::TestCase
  def setup
    @category = categories(:one)
    @user = users(:one)
  end

  test 'should not save bulletin without title' do
    bulletin = Bulletin.new(description: 'Lorem ipsum', category: @category, user: @user)
    assert_not bulletin.save, 'Saved the bulletin without a title'
  end

  test 'should not save bulletin with too short title' do
    bulletin = Bulletin.new(title: 'A', description: 'Lorem ipsum', category: @category, user: @user)
    assert_not bulletin.save, 'Saved the bulletin with a title that is too short'
  end

  test 'should not save bulletin with too long title' do
    bulletin = Bulletin.new(title: 'A' * 51, description: 'Lorem ipsum', category: @category, user: @user)
    assert_not bulletin.save, 'Saved the bulletin with a title that is too long'
  end

  test 'should not save bulletin without description' do
    bulletin = Bulletin.new(title: 'Title', category: @category, user: @user)
    assert_not bulletin.save, 'Saved the bulletin without a description'
  end

  test 'should not save bulletin with too short description' do
    bulletin = Bulletin.new(title: 'Title', description: 'A', category: @category, user: @user)
    assert_not bulletin.save, 'Saved the bulletin with a description that is too short'
  end

  test 'should not save bulletin with too long description' do
    bulletin = Bulletin.new(title: 'Title', description: 'A' * 1001, category: @category, user: @user)
    assert_not bulletin.save, 'Saved the bulletin with a description that is too long'
  end

  test 'should not save bulletin without category' do
    bulletin = Bulletin.new(title: 'Title', description: 'Lorem ipsum', user: @user)
    assert_not bulletin.save, 'Saved the bulletin without a category'
  end

  test 'should not save bulletin without user' do
    bulletin = Bulletin.new(title: 'Title', description: 'Lorem ipsum', category: @category)
    assert_not bulletin.save, 'Saved the bulletin without a user'
  end

  test 'should save bulletin with valid attributes' do
    bulletin = Bulletin.new(
      title: 'Example Title',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      category: @category,
      user: @user
    )
    bulletin.image.attach(io: File.open('test/fixtures/files/bulletin_1.jpg'), filename: 'image.jpg', content_type: 'image/jpeg')

    assert bulletin.save, 'Did not save the valid bulletin'
  end
end
