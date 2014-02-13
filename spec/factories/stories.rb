# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :story do
    name "MyString"
    project { FactoryGirl.create :project }
  end
end
