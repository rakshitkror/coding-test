class VenueSerializer < ActiveModel::Serializer
  attributes :id, :rows, :columns, :name
end
