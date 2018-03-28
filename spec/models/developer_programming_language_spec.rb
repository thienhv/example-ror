# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DeveloperProgrammingLanguage, type: :model do
  describe 'associations' do
    subject { build(:developer_programming_language) }

    it { should belong_to(:programming_language) }
    it { should belong_to(:developer) }
  end
end
