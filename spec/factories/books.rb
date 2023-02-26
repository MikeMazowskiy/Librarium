FactoryBot.define do
  factory :book do
    title              { "title" }
    genre              { "genre" }
    pages              { 9999 }
    year_of_publishing { 1 }
  end
end
