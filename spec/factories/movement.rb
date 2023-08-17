FactoryBot.define do
  factory :movement do
    name { 'Testing' }
    amount { 100 }
    user
    group
    author { association(:user) }
  end
end
