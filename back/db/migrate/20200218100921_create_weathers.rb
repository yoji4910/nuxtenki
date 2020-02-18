class CreateWeathers < ActiveRecord::Migration[5.2]
  def change
    create_table :weathers do |t|
      t.date :date
      t.string :summry
      t.string :icon
      t.float :temperature_high
      t.float :temperature_low
      t.float :rainy_percent
      t.float :humidity

      t.timestamps
    end
  end
end
