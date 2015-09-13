FactoryGirl.define do
  factory :user, class: User do
    email 'admin@example.org'
    password 'password'
  end

  factory :question_radio, class: Question do
    title '5 + 7 - 4'
    score 3
    qtype 'radioButton'
    answers { { 'a' => '7', 'b' => '8', 'c' => '9', 'd' => '10' } }
    correct_answers ['b']
  end

  factory :question_text, class: Question do
    title '5 * 4 - 7'
    score 5
    qtype 'textInput'
    correct_answers ['13']
  end

  factory :question_checkbox, class: Question do
    title '5 * 2 and 5 * 3'
    score 8
    qtype 'checkboxInput'
    answers { { 'a' => '10', 'b' => '13', 'c' => '15', 'd' => '17' } }
    correct_answers ['a', 'c']
  end
end
