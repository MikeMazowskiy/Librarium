FactoryBot.define do
  factory :profile do
    nickname  { "nick_name" }
    firstname { "John" }
    lastname  { "Doe" }
    age       { 1 }
    user      { create :user }
  end
end

