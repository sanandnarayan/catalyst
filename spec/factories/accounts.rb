# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :account, :class => Account do |account|
  users {
      Array(5..10).sample.times.map do
        FactoryGirl.create(:user_without_account) # optionally add traits: FactoryGirl.create(:book, :book_description)
      end
    }
  end
end
