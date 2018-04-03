# frozen_string_literal: true

namespace :dev do
  require 'factory_bot_rails'
  require 'faker'

  desc 'Generate test data'
  task :generate_data, [:users_num] => :environment do |_, args|
    set_args(args)

    create_programming_language
    create_languages

    programming_languages = ProgrammingLanguage.all
    languages = Language.all

    @args[:users_num].times do
      FactoryBot.create :developer,
                        programming_languages: programming_languages.sample(Random.rand(0..3)),
                        languages: languages.sample(Random.rand(0..3))
    end
  end
end

def create_programming_language
  %w[ruby php javascript].each do |name|
    FactoryBot.create :programming_language, name: name
  end
end

def create_languages
  %w[jp en vn].each do |code|
    FactoryBot.create :language, code: code
  end
end

def set_args(args)
  @args = {}
  @args[:users_num] = (args.users_num || 100).to_i
end
