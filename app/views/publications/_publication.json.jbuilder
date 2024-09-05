json.extract! publication, :id, :title, :description, :when_went, :created_at, :updated_at
json.url publication_url(publication, format: :json)
