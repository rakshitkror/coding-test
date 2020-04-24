class AddVenueRefToMovie < ActiveRecord::Migration[6.0]
  def change
    add_reference :movies, :venue
  end
end
