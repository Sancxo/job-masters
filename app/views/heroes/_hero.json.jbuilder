json.extract! hero, :id, :name, :health, :strength, :created_at, :updated_at
json.url hero_url(hero, format: :json)
