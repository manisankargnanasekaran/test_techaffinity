json.extract! report, :id, :mark, :student_id, :subject_id, :created_at, :updated_at
json.url report_url(report, format: :json)
