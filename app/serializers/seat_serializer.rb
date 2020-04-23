class SeatSerializer < ActiveModel::Serializer
  attributes :id, :row, :column, :status

  def id
  	"#{object.row}#{object.column}"
  end
end
