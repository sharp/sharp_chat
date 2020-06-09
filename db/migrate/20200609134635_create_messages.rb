class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :from
      t.string :to
      t.text :content
      t.boolean :viewed, default: false
      t.timestamps
    end
  end
end
