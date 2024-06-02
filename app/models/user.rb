# frozen_string_literal: true

class User < ApplicationRecord
  has_many :bulletins, dependent: :destroy

  validates :email, presence: true, uniqueness: true

  def name_or_email
    name || email
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[name email admin]
  end

  def self.ransortable_attributes(_auth_object = nil)
    %w[name email]
  end
end
