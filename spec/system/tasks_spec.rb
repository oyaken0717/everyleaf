require "rails_helper"

describe "タスク管理機能", type: :system do
  describe "一覧表示機能", type: :system do
    before do
      # user_a = FactoryBot.create(:user, name: 'ユーザーA', email: 'a@aexample.com')
      FactoryBot.create(:task, title: '最初のタスク', content: '最初のタスク', limit: '2019/06/01', status: "未着手") #, user: user_a)
    end

    context "ユーザーAがログインしているとき" do
      # before do
      #   visit login_path
      #   fill_in "メールアドレス", with: "a@example.com"
      #   fill_in "パスワード", with: "password"
      #   click_button "ログインする"
      # end

      it "ユーザーAが作成したタスクが表示される" do
        visit tasks_path
        expect(page).to have_content "最初のタスク"
      end
    end
  end  
end