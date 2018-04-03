# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Search function', type: :system do
  before do
    ruby_programming_language = create :programming_language, name: 'Ruby'
    create :programming_language, name: 'Javascript'
    create :programming_language, name: 'Php'
    create :language, code: 'vn'

    @ruby_devloper = create :developer,
                            email: 'phan.nguyen@example.com',
                            programming_languages: [ruby_programming_language]

    @ruby_devloper_english = create :developer,
                                    email: 'quang.pham@example.com',
                                    programming_languages: [ruby_programming_language],
                                    languages: [create(:language, code: 'en')]
  end

  it 'shows matched records when a programming language is specified' do
    visit('/')

    select 'Ruby', from: 'search_developer_form[programming_language_id]'
    click_on 'Search'

    expect(page).to have_content(@ruby_devloper.email)
  end

  it 'shows matched records when a programming language & language are specified' do
    visit('/')

    select 'Ruby', from: 'search_developer_form[programming_language_id]'
    select 'en', from: 'search_developer_form[language_id]'

    click_on 'Search'
    expect(page).to have_content(@ruby_devloper_english.email)
  end
end
