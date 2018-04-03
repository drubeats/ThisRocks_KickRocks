json.extract! band, :id, :name, :description, :pictureLeft, :pictureRight, :created_at, :updated_at
json.url band_url(band, format: :json)
