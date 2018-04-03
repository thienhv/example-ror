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

    context 'with params' do
      let(:language) { create :language }
      let(:programming_language) { create :programming_language }

      before do
        create_list(:developer, 2)
      end

      it 'returns developers by programming language' do
        create :developer, programming_languages: [programming_language]

        form = SearchDeveloperForm.new(
          programming_language_id: programming_language.id
        )
        expect(form.search.size).to eq(1)
      end

      it 'returns developers by language' do
        create :developer, languages: [language]

        form = SearchDeveloperForm.new(
          language_id: language.id
        )
        expect(form.search.size).to eq(1)
      end

      it 'returns developers by programming language & language' do
        create :developer, programming_languages: [programming_language], languages: [language]

        form = SearchDeveloperForm.new(
          language_id: language.id,
          programming_language_id: programming_language.id
        )
        expect(form.search.size).to eq(1)
      end
    end
  end
end
