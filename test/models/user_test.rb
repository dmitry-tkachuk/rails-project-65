# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user_attrs = {
      email: 'test@example.com'
    }
  end

  test 'should save valid user' do
    user = User.new(@user_attrs)
    assert user.save
  end

  test 'should not save user without email' do
    user = User.new(@user_attrs.except(:email))
    assert_not user.save
  end
end
