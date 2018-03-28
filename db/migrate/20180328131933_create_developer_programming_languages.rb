# frozen_string_literal: true

class CreateDeveloperProgrammingLanguages < ActiveRecord::Migration[5.1]
  def change
    create_table :developer_programming_languages do |t|
      t.references :developer, foreign_key: true
      t.references :programming_language, foreign_key: true
    end

    add_index :developer_programming_languages,
              %i[developer_id programming_language_id],
              unique: true,
              name: 'index_developer_programming_languages'
  end
end
