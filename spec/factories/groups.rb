FactoryBot.define do
  factory :group do
    name { 'Test Group' }
    icon { 'icon.png' }
    association :user, factory: :user
  end
end
