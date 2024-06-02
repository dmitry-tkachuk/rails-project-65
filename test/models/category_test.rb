# frozen_string_literal: true

require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  setup do
    @category_attrs = {
      name: 'Test Category'
    }
  end

  test 'should save valid category' do
    category = Category.new(@category_attrs)
    assert category.save
  end

  test 'should not save category without name' do
    category = Category.new(@category_attrs.except(:name))
    assert_not category.save
  end
end
