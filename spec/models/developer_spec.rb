# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Developer, type: :model do
  describe 'validations' do
    subject { build(:developer) }

    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }

    it { should have_many(:developer_programming_languages) }
    it { should have_many(:programming_languages) }

    it { should have_many(:developer_languages) }
    it { should have_many(:languages) }
  end
end
