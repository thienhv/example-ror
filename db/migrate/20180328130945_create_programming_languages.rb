# frozen_string_literal: true

class CreateProgrammingLanguages < ActiveRecord::Migration[5.1]
  def change
    create_table :programming_languages do |t|
      t.string :name, null: false
    end

    add_index :programming_languages, :name, unique: true
  end
end
