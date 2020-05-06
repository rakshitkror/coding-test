class RemoveTimestampsFromSeats < ActiveRecord::Migration[6.0]
  def change

    remove_column :seats, :created_at, :string

    remove_column :seats, :updated_at, :string
  end
end
