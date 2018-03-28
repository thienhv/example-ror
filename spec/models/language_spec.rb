# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Language, type: :model do
  describe 'validations' do
    subject { build(:language) }

    it { should validate_presence_of(:code) }
    it { should validate_uniqueness_of(:code) }

    it { should have_many(:developer_languages) }
    it { should have_many(:developers) }
  end
end
