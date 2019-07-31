FactoryBot.define do

  factory :user do
    name                  {"taa"}
    email                 {"kkk@gmail.com"}
    encrypted_password    {"00000000"}
    avator                {"aaa"}
    prefecture            {"kyoto"}
    address               {"chukyouku2-31"}
    birth_date            {"19900101"}
    introduction          {"初めまして"}
    password_confirmation {"00000000"}
  end

end