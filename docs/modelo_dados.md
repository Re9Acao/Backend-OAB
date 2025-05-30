// Use DBML to define your database structure
// Docs: https://dbml.dbdiagram.io/docs



Table users {
  id bigint [primary key, not null]
  email varchar [not null]
  encrypted_password varchar [not null]
  reset_password_token varchar
  reset_password_sent_at timestamp
  remember_created_at timestamp
  sign_in_count integer [not null]
  current_sign_in_at timestamp
  last_sign_in_at timestamp
  current_sign_in_ip varchar
  last_sign_in_ip varchar
  created_at timestamp [not null]
  updated_at timestamp [not null]
  provider varchar
  uid varchar
  allow_password_change boolean
  tokens json
  role integer [not null, note: '0 = admin, 1 = basic, 2 = premium']
}

Table law_areas {
  id bigint [primary key, not null]
  name varchar [not null]
  description varchar
  created_at timestamp [not null]
  updated_at timestamp [not null]
}

Table questions {
  id               bigint    [pk, not null]
  title            string    [not null]
  evaluation_board string
  year             string
  option_1         string    [not null]
  option_2         string    [not null]
  option_3         string    
  option_4         string    
  option_5         string
  correct_option   integer
  available        boolean   [not null]
  law_area_id      bigint    [not null, ref: > law_areas.id]
  question_type             smallint  [not null, note: '1 = objetiva, 2 = discursiva, 3 = dissertativa']
  created_at       datetime  [not null]
  updated_at       datetime  [not null]
}


Table evaluations {
  id bigint [primary key, not null]
  user_id bigint [not null, ref: > users.id]
  expires_at timestamp
  finished boolean [not null]
  correct_score integer
  created_at timestamp [not null]
  updated_at timestamp [not null]
}

Table evaluation_law_areas {
  id bigint [primary key, not null]
  evaluation_id bigint [not null, ref: > evaluations.id]
  law_area_id bigint [not null, ref: > law_areas.id]
  created_at timestamp [not null]
  updated_at timestamp [not null]
}

Table evaluation_questions {
  id bigint [primary key, not null]
  evaluation_id bigint [not null, ref: > evaluations.id]
  question_id bigint [not null, ref: > questions.id]
  created_at timestamp [not null]
  updated_at timestamp [not null]
}
 

Table user_answers {
  id bigint [primary key, not null]
  user_id bigint [not null, ref: > users.id]
  evaluation_question_id bigint [not null, ref: > evaluation_questions.id]
  question_type smallint [not null, note: '1 = objetiva, 2 = discursiva, 3 = dissertativa'] 
  selected_option string
  written_answer text
  created_at timestamp [not null]
  updated_at timestamp [not null]
}


Table standard_answers {
  id          bigint   [pk, not null]
  question_id bigint   [not null, ref: > questions.id, unique]
  text        text     [not null]
  is_active   boolean  [not null]
  created_at  datetime [not null]
  updated_at  datetime [not null]
}

Table user_performance {
  id bigint [pk, not null]
  evaluation_id bigint [ref: > evaluations.id, null]
  user_id bigint [ref: > users.id, not null]
  law_area_id bigint [ref: > law_areas.id, not null]
  question_type smallint [not null]
  correct_count integer [not null]
  incorrect_count integer [not null]
  total_questions integer [not null]
  created_at datetime [not null]
  updated_at datetime [not null]
}




