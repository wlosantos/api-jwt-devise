FactoryBot.define do
  factory :jwt_denylist do
    jti { "MyString" }
    exp { "2022-12-07 22:05:11" }
  end
end
