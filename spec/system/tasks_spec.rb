require "rails_helper"

describe "タスク管理機能", type: :system do
    # let(:user_a){ FactoryBot.create(:user, name: "ユーザーA", email: "a@example.com") }
    # let(:user_b){ FactoryBot.create(:user, name: "ユーザーB", email: "b@example.com") }
    let!(:task_a) { FactoryBot.create(:task, title: '最初のタスク', content: '最初のタスク', limit: '2019/06/01', status: "未着手", priority: "低") }#, user: user_a) 
    let!(:task_b) { FactoryBot.create(:task, title: '次のタスク', content: '次のタスク', limit: '2019/06/02', status: "未着手", priority: "中") }
    let!(:task_c) { FactoryBot.create(:task, title: '次のタスク', content: '三番目のタスク', limit: '2019/06/03', status: "未着手", priority: "高") }

    before do
      # visit login_path
      # fill_in "メールアドレス", with: login_user.email
      # fill_in "パスワード", with: login_user.password
      # click_button "ログインする"
      visit tasks_path
    end

    shared_examples_for "ユーザーAが作成したタスクが表示される" do
      it { expect(page).to have_content '最初のタスク' }
    end
  
  describe "一覧表示機能" do
    context "ユーザーAがログインしているとき" do
      # let(:login_user) { user_a }
      it_behaves_like "ユーザーAが作成したタスクが表示される"
    end

      # context "ユーザーBがログインしているとき" do
        # let(:login_user){ user_b }

        # it "ユーザーAが作成したタスクが表示されない" do
        #   expect(page).to have_no_content "最初のタスク"
        # end
      # end
  end

  # describe "タスクが作成日時の降順に並んでいるかのテスト" do
  #   context "一覧表示にいったとき" do
  #     it "タスクが作成日時の降順に並んでいる" do
  #       expect(Task.order("created_at DESC").map(&:id)).to eq [4,3]
  #     end
  #   end
  # end

  describe "タスクが優先順位の高い順に並んでいるかのテスト" do
    context "一覧表示に行ったとき" do
      it "タスクが優先順位に基づいてならんでいる" do
        click_on "優先順位でソート"
        expect(Task.order("priority DESC").map(&:priority)).to eq ["高","中","低"]
      end
    end
  end

  describe "終了期限の降順" do
    context "終了期限でソートを押すと" do
      it "終了期限順で並ぶ" do
        click_link "終了期限でソート"
        tasks = Task.order(limit: "ASC")
        expect(tasks[0].limit < tasks[1].limit).to be true

      end
    end
  end
 
  describe "詳細表示機能" do
    context "ユーザーAがログインしているとき" do
      # let(:login_user){ user_a }

      before do
        visit task_path(task_a)
      end

      it_behaves_like "ユーザーAが作成したタスクが表示される"
    end
  end

  describe "新規作成機能" do
    # let(:login_user){ user_a }
    before do
      visit new_task_path
      fill_in 'task_title', with: task_name
      fill_in "task_content", with: "次のタスク"
      fill_in "task_limit", with: Date.today
      # fill_in "task_status", with: "未着手"
      select "未着手", from: "task_status" 
      click_button "登録する"
    end

    context "新規作成画面で名称を入力したとき" do
      let(:task_name){ "次のタスク" }
      it "正常に登録される" do
        expect(page).to have_content "次のタスク"
      end
    end

    context "新規作成画面で名称を入力しなかったとき" do
      let(:task_name){ "" }

      it "エラーとなる" do
        expect(page).to have_content "エラーがあります"
      end
    end
  end
end