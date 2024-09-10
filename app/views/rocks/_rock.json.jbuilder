json.extract! rock, :id, :rock_name, :material, :weight, :weight_unit, :location,  :notes, :color, :condition, :dimensions, :source, :category, :hardness, :price, :created_at, :updated_at

json.photos rock.photos do |photo|
  json.id photo.id
  json.url photo.url
  json.created_at photo.created_at
  json.updated_at photo.updated_at
end