class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.decimal :longitude,                 index: true
      t.decimal :latitude,                  index: true
      t.string :name,          null: false, index: true
    end
  end
end
