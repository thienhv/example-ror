# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DeveloperLanguage, type: :model do
  describe 'associations' do
    subject { build(:developer_language) }

    it { should belong_to(:language) }
    it { should belong_to(:developer) }
  end
end
