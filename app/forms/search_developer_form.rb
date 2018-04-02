# frozen_string_literal: true

class SearchDeveloperForm
  include Virtus.model
  include ActiveModel::Model

  attribute :programming_language, ProgrammingLanguage

  def search
    query = Developer.all
    return query if programming_language.empty?

    query = query.includes(:developer_programming_languages)
                 .joins(:developer_programming_languages)
                 .where(
                   'developer_programming_languages.programming_language_id=?',
                   programming_language
                 )
    query
  end
end
