# frozen_string_literal: true

class SearchDeveloperForm
  include Virtus.model
  include ActiveModel::Model

  attribute :programming_language_id, String
  attribute :language_id, String

  def search
    query = Developer.all
    return query if programming_language_id.blank? && language_id.blank?

    query = search_programming_language(query) if programming_language_id.present?
    query = search_language(query) if language_id.present?
    query
  end

  private

  def search_programming_language(query)
    query.includes(:developer_programming_languages)
         .joins(:developer_programming_languages)
         .where(
           'developer_programming_languages.programming_language_id=?',
           programming_language_id
         )
  end

  def search_language(query)
    query.includes(:developer_languages)
         .joins(:developer_languages)
         .where(
           'developer_languages.language_id=?',
           language_id
         )
  end
end
