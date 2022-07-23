FactoryBot.define do
  factory :user do
    sequence :email do |number|
      "person#{number}@mail.com"
    end
    password { "password" }
  end
end
