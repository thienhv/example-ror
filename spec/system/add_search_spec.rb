# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Search function', type: :system do
  before do
    @ruby_programming_language = create :programming_language, name: 'Ruby'
    create :programming_language, name: 'Javascript'
    create :programming_language, name: 'Php'

    @english = create :language, code: 'en'
    create :language, code: 'vn'

    create_ruby_developer
    create_ruby_developer_have_english
  end

  it 'Being able to search developers who can write Ruby' do
    visit('/')

    select 'Ruby', from: 'search_developer_form[programming_language]'
    click_button 'Search'

    expect(page).to have_content(@ruby_devloper.email)
  end

  it 'Being able to search developers who can write Ruby and speak English' do
    visit('/')

    select 'Ruby', from: 'search_developer_form[programming_language]'
    select 'en', from: 'search_developer_form[language]'

    click_button 'Search'
    expect(page).to have_content(@ruby_devloper_english.email)
  end
end

def create_ruby_developer
  @ruby_devloper = create :developer, email: 'phan.nguyen@example.com'
  @ruby_devloper.developer_programming_languages.create(
    programming_language: @ruby_programming_language
  )
end

def create_ruby_developer_have_english
  @ruby_devloper_english = create :developer, email: 'quang.pham@example.com'
  @ruby_devloper_english.developer_programming_languages.create(
    programming_language: @ruby_programming_language
  )
  @ruby_devloper_english.developer_languages.create(
    language: @english
  )
end
