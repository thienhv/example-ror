# frozen_string_literal: true

class SearchDeveloperForm
  include Virtus.model
  include ActiveModel::Model

  attribute :programming_language_id, String
  attribute :language_id, String

  def search
    query = Developer.all
    query = search_by_programming_language(query) if programming_language_id?
    query = search_by_language(query) if language_id?
    query
  end

  private

  def programming_language_id?
    programming_language_id.present?
  end

  def language_id?
    language_id.present?
  end

  def search_by_programming_language(query)
    query.includes(:developer_programming_languages)
         .joins(:developer_programming_languages)
         .where(
           'developer_programming_languages.programming_language_id=?',
           programming_language_id
         )
  end

  def search_by_language(query)
    query.includes(:developer_languages)
         .joins(:developer_languages)
         .where(
           'developer_languages.language_id=?',
           language_id
         )
  end
end
