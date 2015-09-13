class CreateQuestions < ActiveRecord::Migration
  def change
    enable_extension 'hstore'

    create_table :questions do |t|
      t.text    :title
      t.integer :score, default: 0
      t.string  :qtype, null: false
      t.hstore  :answers
      t.string  :correct_answers, array: true
      t.bigint :checksum, null: false

      t.timestamps null: false
    end

    add_index :questions, :checksum, unique: true
  end
end
