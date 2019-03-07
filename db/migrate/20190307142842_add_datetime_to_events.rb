class AddDatetimeToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :date_time, :string
  end
end
