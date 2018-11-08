class CreateAnswerChoices < ActiveRecord::Migration[5.2]
  def change
    create_table :answer_choices do |t|
      t.integer :question_id, null: false
      t.text :answer_choice, null: false
      t.timestamps
    end
    add_index :answer_choices, :question_id, unique: true
  end
end
