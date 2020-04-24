class AddSeatCombinationToSeat < ActiveRecord::Migration[6.0]
  def change
    add_column :seats, :seat_combination, :string
  end
end
