# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :bulletins, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[id name]
  end

  def self.ransortable_attributes(_auth_object = nil)
    %w[name]
  end
end
