# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SearchDeveloperForm do
  describe '#search' do
    context 'with no params' do
      it 'returns all developers' do
        create_list(:developer, 2)

        form = SearchDeveloperForm.new
        expect(form.search.size).to eq(2)
      end
    end

    context 'with from params' do
      let(:language_en) { create :language, code: 'en' }
      let(:developer) { create :developer }
      let(:ruby_programming_language) { create :programming_language, name: 'Ruby' }
      let(:developer_list) { create_list(:developer, 2) }

      it 'returns developers by programming language' do
        developer_list
        developer.developer_programming_languages.create(
          programming_language: ruby_programming_language
        )

        form = SearchDeveloperForm.new(
          programming_language: ruby_programming_language.id
        )
        expect(form.search.size).to eq(1)
      end

      it 'returns developers by language' do
        developer_list
        developer.developer_languages.create(
          language: language_en
        )

        form = SearchDeveloperForm.new(
          language: language_en.id
        )
        expect(form.search.size).to eq(1)
      end

      it 'returns developers by programming language & language' do
        developer_list
        developer.developer_languages.create(
          language: language_en
        )
        developer.developer_programming_languages.create(
          programming_language: ruby_programming_language
        )

        form = SearchDeveloperForm.new(
          language: language_en.id,
          programming_language: ruby_programming_language.id
        )
        expect(form.search.size).to eq(1)
      end
    end
  end
end
