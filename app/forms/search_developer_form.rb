# frozen_string_literal: true

class SearchDeveloperForm
  include Virtus.model
  include ActiveModel::Model

  attribute :programming_language, ProgrammingLanguage
  attribute :language, Language

  def initialize(params = {})
    @programming_language = params[:programming_language] || ''
    @language = params[:language] || ''
  end

  def search
    query = Developer.all
    return query if programming_language.blank? && language.blank?

    query = search_programming_language(query) if programming_language.present?
    query = search_language(query) if language.present?
    query
  end

  private

  def search_programming_language(query)
    query.includes(:developer_programming_languages)
         .joins(:developer_programming_languages)
         .where(
           'developer_programming_languages.programming_language_id=?',
           programming_language
         )
  end

  def search_language(query)
    query.includes(:developer_languages)
         .joins(:developer_languages)
         .where(
           'developer_languages.language_id=?',
           language
         )
  end
end
