class CreateDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :details do |t|
      t.string :thoughts

      t.timestamps
    end
  end
end
