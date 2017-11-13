class CreateTodohomeworks < ActiveRecord::Migration[5.1]
  def change
    create_table :todohomeworks do |t|
      t.text :description
      t.date :date
      t.timestamps
    end
  end
end
