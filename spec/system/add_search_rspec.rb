# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Search function', type: :system do
  before do
    @ruby_programming_language = create :programming_language, name: 'Ruby'
    create :programming_language, name: 'Javascript'
    create :programming_language, name: 'Php'

    @ruby_devloper = create :developer, email: 'phan.nguyen@example.com'
    @ruby_devloper.developer_programming_languages.create(
      programming_language: @ruby_programming_language
    )
  end

  it 'Being able to search developers who can write Ruby' do
    visit('/')

    select 'Ruby', from: 'search_developer_form[programming_language]'
    click_button 'Search'

    expect(page).to have_content(@ruby_devloper.email)
  end
  it 'Being able to search developers who can write Ruby and speak English'
end
