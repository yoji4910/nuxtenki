class CreateWeathers < ActiveRecord::Migration[5.2]
  def change
    create_table :weathers do |t|
      t.integer :unix_time
      t.string :summary
      t.string :icon
      t.float :temperature_high
      t.float :temperature_low
      t.integer :rainy_percent
      t.integer :humidity

      t.timestamps
    end
  end
end
