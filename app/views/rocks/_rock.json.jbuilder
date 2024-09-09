json.extract! rock, :id, :rock_name, :type, :weight, :weight_unit, :location, :price, :date_acquired, :notes, :color, :condition, :dimensions, :source, :category, :hardness, :created_at, :updated_at
json.url rock_url(rock, format: :json)
