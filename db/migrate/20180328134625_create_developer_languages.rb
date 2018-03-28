# frozen_string_literal: true

class CreateDeveloperLanguages < ActiveRecord::Migration[5.1]
  def change
    create_table :developer_languages do |t|
      t.references :developer, foreign_key: true
      t.references :language, foreign_key: true
    end

    add_index :developer_languages, %i[developer_id language_id], unique: true
  end
end
