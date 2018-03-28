# frozen_string_literal: true

class ProgrammingLanguage < ApplicationRecord
  validates :name, uniqueness: true, presence: true
end
