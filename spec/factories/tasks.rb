FactoryBot.define do
  factory :task do
    title { "テストを書く" }
    content { "テストを書く" }
    limit { "2019/06/01" }
    # priority { 0 }
    status { "未着手" }
    # description { "Rspec&Capybara&FactoryBotを準備する" }
    # user
  end
end