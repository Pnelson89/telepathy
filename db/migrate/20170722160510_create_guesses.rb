class CreateGuesses < ActiveRecord::Migration[5.1]
  def change
    create_table :guesses do |t|
      t.string :word_1
      t.string :word_2
      t.string :answer, null: false
      t.belongs_to :player, null: false
      t.belongs_to :game, null: false

      t.timestamps
    end
  end
end
