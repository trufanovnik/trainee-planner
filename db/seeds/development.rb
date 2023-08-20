# frozen_string_literal: true

5.times do |user_id|
  User.create_or_find_by!(
    first_name: "Name #{user_id}",
    email: "mail#{user_id}@example.com",
    password: "password#{user_id}"
  )
rescue ActiveRecord::RecordInvalid => e
end
