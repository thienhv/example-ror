# frozen_string_literal: true

class Language < ApplicationRecord
  validates :code, uniqueness: true, presence: true
end
