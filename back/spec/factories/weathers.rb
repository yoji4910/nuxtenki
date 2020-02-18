FactoryBot.define do
  factory :weather do
    date { "2020-02-18" }
    summry { "MyString" }
    icon { "MyString" }
    temperature_high { 1.5 }
    temperature_low { 1.5 }
    rainy_percent { 1.5 }
    humidity { 1.5 }
  end
end
