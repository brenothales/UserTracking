class CreateRastreamentos < ActiveRecord::Migration
  def change
    create_table :rastreamentos do |t|
      t.string :visitante
      t.string :url
      t.string :titulo
      t.datetime :data_hora

      t.timestamps null: false
    end
  end
end
