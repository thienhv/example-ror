# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProgrammingLanguage, type: :model do
  describe 'validations' do
    subject { build(:programming_language) }

    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }

    it { should have_many(:developer_programming_languages) }
    it { should have_many(:developers) }
  end
end
