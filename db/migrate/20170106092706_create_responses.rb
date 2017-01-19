class CreateResponses < ActiveRecord::Migration[5.0]
  def change
    create_table :responses do |t|
      t.string :responder
      t.text :body
      t.references :note, foreign_key: true

      t.timestamps
    end
  end
end
