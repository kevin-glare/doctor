json.array!(@patients) do |patient|
  json.extract! patient, :id, :name, :first_name, :last_name, :middle_name, :date_of_birth, :user_id, :created_at, :updated_at
end
