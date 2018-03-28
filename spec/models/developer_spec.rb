# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Developer, type: :model do
  describe 'validations' do
    subject { build(:developer) }

    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
  end
end
