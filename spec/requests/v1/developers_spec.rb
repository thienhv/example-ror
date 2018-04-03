# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::DevelopersController', type: :request do
  include_context 'api'

  describe 'GET /api/v1/developers' do
    context 'without params' do
      let(:programming_languages) do
        {
          data: @developer.programming_languages.map do |programming_language|
            {
              id: programming_language.id,
              name: programming_language.name
            }
          end
        }
      end
      let(:languages) do
        {
          data: @developer.languages.map do |language|
            {
              id: language.id,
              code: language.code
            }
          end
        }
      end
      let(:expected_response) do
        {
          data: Developer.all.map do |developer|
            {
              id: developer.id.to_s,
              type: 'developers',
              attributes: {
                email: developer.email
              },
              relationships: {
                programming_languages: programming_languages,
                languages: languages
              }
            }
          end
        }
      end

      before do
        @developer = create :developer,
                            programming_languages: [create(:programming_language)],
                            languages: [create(:language)]

        get '/api/v1/developers'
      end

      it_behaves_like 'http_status_code_200_with_json'
    end
  end
end
