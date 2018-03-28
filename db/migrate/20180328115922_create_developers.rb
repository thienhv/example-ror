# frozen_string_literal: true

class CreateDevelopers < ActiveRecord::Migration[5.1]
  def change
    create_table :developers do |t|
      t.string :email, null: false
    end

    add_index :developers, :email, unique: true
  end
end
