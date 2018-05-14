json.extract! course, :id, :name, :description, :pic, :hours, :created_at, :updated_at
json.url course_url(course, format: :json)
