json.extract! weapon, :id, :name, :type, :bonus, :illustration, :created_at, :updated_at
json.url weapon_url(weapon, format: :json)
json.illustration url_for(weapon.illustration)
