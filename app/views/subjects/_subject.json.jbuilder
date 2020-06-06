json.extract! subject, :id, :subject_name, :subject_code, :is_finished, :user_id, :created_at, :updated_at
json.url subject_url(subject, format: :json)
