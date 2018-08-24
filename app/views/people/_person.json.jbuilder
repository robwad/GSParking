json.extract! person, :id, :email, :password, :has_space, :points, :created_at, :updated_at
json.url person_url(person, format: :json)
