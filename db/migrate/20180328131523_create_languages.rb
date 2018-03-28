# frozen_string_literal: true

class CreateLanguages < ActiveRecord::Migration[5.1]
  def change
    create_table :languages do |t|
      t.string :code, null: false
    end

    add_index :languages, :code, unique: true
  end
end
