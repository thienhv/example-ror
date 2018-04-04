# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Search function', type: :system do
  before do
    @language = create(:language)
    @programming_language = create :programming_language
    @developer = create :developer, programming_languages: [@programming_language]
    @developer_have_language = create :developer,
                                      programming_languages: [@programming_language],
                                      languages: [@language]
  end

  it 'shows matched records when a programming language is specified' do
    visit('/')

    select @programming_language.name, from: 'search_developer_form[programming_language_id]'
    click_on 'Search'

    expect(page).to have_content(@developer.email)
    expect(page).to have_select('search_developer_form[programming_language_id]', selected: @programming_language.name)
  end

  it 'shows matched records when a programming language & language are specified' do
    visit('/')

    select @programming_language.name, from: 'search_developer_form[programming_language_id]'
    select @language.code, from: 'search_developer_form[language_id]'

    click_on 'Search'
    expect(page).to have_content(@developer_have_language.email)
    expect(page).to have_select('search_developer_form[programming_language_id]', selected: @programming_language.name)
    expect(page).to have_select('search_developer_form[language_id]', selected: @language.code)
  end
end
