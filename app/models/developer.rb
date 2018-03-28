# frozen_string_literal: true

class Developer < ApplicationRecord
  validates :email, uniqueness: true, presence: true
end
