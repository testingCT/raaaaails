class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :last_name
      t.string :first_name
      t.date :date_of_birth

      t.timestamps
    end
  end
end
