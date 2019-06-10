# describe はテストのグループ化を宣言します。
# ここでは「四則演算に関するテストを書くよー」と宣言
describe " 四則演算"do
  it "1 + 1 は 2 になること" do
    expect(1+1).to eq 2
  end
end

(1 + 2).should eq 3
(1 + 2).should == 3
(1 + 2).should == 3

# example =（it do ... end）
describe ""do 
  it "1 + 1 は 2 になること"do
    expect(1 + 1).to eq 2
  end
  it "10 - 1 は 9 になること"do
    expect(10 - 1).to eq 9
  end
end

describe"四則計算"do
  it "全部できること"do
    expect(1 + 2).to eq 3
    expect(10 - 1).to eq 9
    expect(4 * 8).to eq 32
    expect(40 / 5).to eq 8
  end
end

describe "四則演算" do
  describe "足し算" do
    it"1 + 1 は 2 になること"do
      expect(1 + 1).to eq　2
    end
  end
  describe "引き算" do
    it"10 - 1 は 9 になること"do
      expect(10 - 1).to eq 9
    end
  end    
end

class User 
  def initialize(name:, age:)
    @name = name
    @age = age
  end
  def greet
    if @age <= 12
      "僕は#{@name}だよ。"
    else
      "僕は#{@name}です。"
    end
  end
end

describe User do
  describe "#greet" do
    it "12歳以下の場合、ひらがなで答えること" do
      user = User.new(name: "たろう", age: 12)
      expect(user.greet).to eq "ぼくはたろうだよ。"
    end
    it "13歳以上の場合、漢字で答えること" do
      user = User.new(name: "たろう", age: 13)
      expect(user.greet).to eq "僕はたろうです。"
    end
  end  
end

# describe 以外にも context という機能でテストをグループ化することもできます。
# どちらも機能的には同じ。context は条件を分けたりするときに使うことが多いです。
describe User do
  describe "#greet" do
    context "12歳以下の場合"do
      it"ひらがなで答えること"do
        user = User.new(name: "たろう", age: 12)
        expect(user.greet).to eq "ぼくはたろうだよ。"
      end
    end
    context "13歳以上の場合"do
      it"漢字で答えること"do
        user = User.new(name: "たろう", age: 13)
        expect(user.greet).to eq "ぼくはたろうです。"
      end
    end
  end
end

# before do ... end で囲まれた部分は example の実行前に毎回呼ばれます。
describe User do
  describe "#greet" do
    before do
      @params = { name: "たろう"}
    end
    context "12歳以下の場合"do
      it"ひらがなで答えること"do
        user = User.new(@params.merge(age: 12)
        expect(user.greet).to eq "ぼくはたろうだよ。"
      end
    end
    context "13歳以上の場合"do
      it"漢字で答えること"do
        user = User.new(@params.merge(age: 13)
        expect(user.greet).to eq "ぼくはたろうです。"
      end
    end
  end
end

describe User do
  describe "#greet" do
    before do
      @params = { name: "たろう"}
    end
    context "12歳以下の場合"do
      before do
        @params.merge!(age: 12)
      end
      it"ひらがなで答えること"do
        user = User.new(@params)
        expect(user.greet).to eq "ぼくはたろうだよ。"
      end
    end
    context "13歳以上の場合"do
      before do
        @params.merge!(age: 13)
      end
      it"漢字で答えること"do
        user = User.new(@params)
        expect(user.greet).to eq "ぼくはたろうです。"
      end
    end
  end
end

describe User do
  describe "#greet" do
    let(:params){{name:"たろう"}}
    context "12歳以下の場合"do
      before do
        @params.merge!(age: 12)
      end
      it"ひらがなで答えること"do
        user = User.new(params)
        expect(user.greet).to eq "ぼくはたろうだよ。"
      end
    end
    context "13歳以上の場合"do
      before do
        @params.merge!(age: 13)
      end
      it"漢字で答えること"do
        user = User.new(params)
        expect(user.greet).to eq "ぼくはたろうです。"
      end
    end
  end
end

describe User do
  describe "#greet" do
    let(:params) do
      hash = {}
      hash[:name] = "たろう"
      hash
    end
    context "12歳以下の場合"do
      before do
        @params.merge!(age: 12)
      end
      it"ひらがなで答えること"do
        user = User.new(params)
        expect(user.greet).to eq "ぼくはたろうだよ。"
      end
    end
    context "13歳以上の場合"do
      before do
        @params.merge!(age: 13)
      end
      it"漢字で答えること"do
        user = User.new(params)
        expect(user.greet).to eq "ぼくはたろうです。"
      end
    end
  end
end

describe User do
  describe "#greet" do
    let(:user){ User.new(params)}
    let(:params){{name: "たろう"}}
    context "12歳以下の場合"do
      before do
        @params.merge!(age: 12)
      end
      it"ひらがなで答えること"do
        expect(user.greet).to eq "ぼくはたろうだよ。"
      end
    end
    context "13歳以上の場合"do
      before do
        @params.merge!(age: 13)
      end
      it"漢字で答えること"do
        expect(user.greet).to eq "ぼくはたろうです。"
      end
    end
  end
end

describe User do
  describe "#greet" do
    let(:user){ User.new(params)}
    let(:params){{name: "たろう", age: age}}
    context "12歳以下の場合"do
      let(:age){ 12 }
      it"ひらがなで答えること"do
        expect(user.greet).to eq "ぼくはたろうだよ。"
      end
    end
    context "13歳以上の場合"do
    let(:age){ 13 }
      it"漢字で答えること"do
        expect(user.greet).to eq "ぼくはたろうです。"
      end
    end
  end
end

describe User do
  describe "#greet" do
    let(:user){ User.new(params)}
    let(:params){{name: "たろう", age: age}}
    subject { user.great}
    context "12歳以下の場合"do
      let(:age){ 12 }
      it"ひらがなで答えること"do
        is_expected.to eq "ぼくはたろうだよ。"
      end
    end
    context "13歳以上の場合"do
    let(:age){ 13 }
      it"漢字で答えること"do
        is_expected.to eq "ぼくはたろうです。"
      end
    end
  end
end

describe User do
  describe "#greet" do
    let(:user){ User.new(params)}
    let(:params){{name: "たろう", age: age}}
    subject { user.great}
    context "12歳以下の場合"do
      let(:age){ 12 }
      it { is_expected.to eq "ぼくはたろうだよ。" }
    end
    context "13歳以上の場合"do
      let(:age){ 13 }
      it { is_expected.to eq "ぼくはたろうです。" }
    end
  end
end

describe User do
  describe "#greet" do
    let(:user){ User.new(name: "たろう", age: age)}
    subject { user.great}
    context "12歳以下の場合"do
      let(:age){ 12 }
      it { is_expected.to eq "ぼくはたろうだよ。" }
    end
    context "13歳以上の場合"do
      let(:age){ 13 }
      it { is_expected.to eq "ぼくはたろうです。" }
    end
  end
end

describe User do
  describe "#greet" do
    let(:user){ User.new(params)}
    let(:params){{name: "たろう", age: age}}
    context "when 12 years old or younger"do
      let(:age){ 12 }
      it "greats in hiragana"do
        expect(user.greet).to eq "ぼくはたろうだよ。"
      end
    end
    context "when 13 years old or older"do
    let(:age){ 13 }
      it "greets in kanji" do
        expect(user.greet).to eq "ぼくはたろうです。"
      end
    end
  end
end

it "1 + 1 は 2 になること" do
  expect(1+1).to eq 2 
end

specify "1 + 1 は 2 になること" do
  expect(1+1).to eq 2 
end

example "1 + 1 は 2 になること" do
  expect(1+1).to eq 2 
end

describe User do
  describe "#greet" do
    let(:user){ User.new(name: "たろう", age: age)}
    subject { user.great}
    context "0歳以下の場合"do
      let(:age){ 0 }
      it { is_expected.to eq "ぼくはたろうだよ。" }
    end
    context "12歳以下の場合"do
      let(:age){ 12 }
      it { is_expected.to eq "ぼくはたろうだよ。" }
    end
    context "13歳の場合"do
      let(:age){ 13 }
      it { is_expected.to eq "ぼくはたろうです。" }
    end
    context "100歳の場合"do
      let(:age){ 100 }
      it { is_expected.to eq "ぼくはたろうです。" }
    end
  end
end

describe User do
  describe "#greet" do
    let(:user){ User.new(name: "たろう", age: age)}
    subject { user.great}

    shared_example"子供のあいさつ"do
      it { is_expected.to eq "ぼくはたろうだよ。" }
    end
    context "0歳以下の場合"do
      let(:age){ 0 }
      it_behaves_like "子供のあいさつ"
    end
    context "12歳以下の場合"do
      let(:age){ 12 }
      it_behaves_like "子供のあいさつ"
    end

    shared_example"大人のあいさつ"do
      it { is_expected.to eq "僕はたろうだよ。" }
    end
    
    context "13歳の場合"do
      let(:age){ 13 }
      it_behaves_like "大人のあいさつ"
    end
    context "100歳の場合"do
      let(:age){ 100 }
      it_behaves_like "大人のあいさつ"
    end
  end
end

class User
  def initialize(name:, age:)
    @name = name
    @age = age
  end
  def
    if child?
      "ぼくは#{@name}だよ。"
    else
      "僕は#{@name}だよ。"
    end
  end
  def child?
     @age <= 12
  end
end

describe User do
  describe "#greet" do
    let(:user){ User.new(name: "たろう", age: age)}
    subject { user.great}
    context "12歳以下の場合"do
      let(:age){ 12 }
      it { is_expected.to eq "ぼくはたろうだよ。" }
    end
    context "13歳以上の場合"do
      let(:age){ 13 }
      it { is_expected.to eq "僕はたろうです。" }
    end
  end

  describe "#child" do
    let(:user){ User.new(name: "たろう", age: age)}
    subject { user.child?}
    context "12歳以下の場合"do
      let(:age){ 12 }
      it { is_expected.to eq true }
    end
    context "13歳以上の場合"do
      let(:age){ 13 }
      it { is_expected.to eq false }
    end
  end
end

describe User do
  let(:user){ User.new(name: "たろう", age: age)}
  shared_context "12歳の場合" do
    let(:age){ 12 }
  end
  shared_context "13歳の場合" do
    let(:age){ 13 }
  end

  describe "#greet" do        
    subject { user.great}
    context "12歳以下の場合"do
      include_context "12歳の場合"  
      it { is_expected.to eq "ぼくはたろうだよ。" }
    end
    context "13歳以上の場合"do
      include_context "13歳の場合"
      it { is_expected.to eq "僕はたろうです。" }
    end
  end

  describe "#child" do
    subject { user.child?}
    context "12歳以下の場合"do
      include_context "12歳の場合"  
      it { is_expected.to eq true }
    end
    context "13歳以上の場合"do
    include_context "13歳の場合"  
      it { is_expected.to eq false }
    end
  end
end

expect{ you.read_this_entry }.to change{ you.matcher_expert? }.from(be_falsey).to(be_truthy)

expect( 1+2 ).to eq 3
expect([1,2,3]).to include 2
expect( 1+2 ).not_to eq 1
expect( 1+2 ).to_not eq 1
expect( 1+2 ).to be >= 3

message = "Hello"
expect([message].first).to be message

message_1 = "Hello"
message_2 = "Hello"
expect([message_1].first).to be message_2

message_1 = "Hello"
message_2 = "Hello"
expect([message_1].first).to eq message_2

expect(true).to be true
expect(false).to be false
expect(nil).to be nil

expect( 1+1 ).to be 2
expect(:foo).to be :foo

expect[()].to be_empty 
expect[().empty?].to be true 
expect[().empty?].to eq true

user = User.new(name: "Tom", email: "tom@example.com")
expect(user).to be_valid

class User < ActiveRecord::Base
  validates :name, :email, presence: true
end

user = User.new
expect(user.save).to be_falsey

user.name ="Tom"
user.email="tom@example.com"
expect(user.save).to be_truthy

expect(1).to be_truthy
expect(nil).to be_falsey

expect(1).to be true
expect(nil).to be false

expect(1).to eq true
expect(nil).to eq false

x =[1,2,3]
expect(x.size).to eq 3
x.pop
expect(x.size).to eq 2

x =[1,2,3]
expect{x.pop}.to change {x.size}.from(3).to(3) 

x =[1,2,3]
expect{x.pop}.to change {x.size}.by(-1)

x =[1,2,3]
expect{x.push(10)}.to change {x.size}.by(1)

class User < ActiveRecord::Base
  has_many :blogs, dependent: :destroy
end

class Blog < ActiveRecord::Base
  belongs_to :user
end

it "userを削除すると、userが書いたblogも削除されること" do
   user = User.create(name: "Tom", email: "tom@example.com")
   user.blogs.create(title: "Rspec必勝法", content: "あとで書く")
   expect{user.destroy}.to change{Blog.count}.by(-1)
end

x =[1,2,3]
expect(x).to include 1
expect(x).to include 1,3

expect{1/0}.to raise_error ZeroDivisionError

class ShoppingCart
  def initialize
    @items = []
  end
  def add(item)
    raise "Item is nil." if item.nil?
    @items << item
  end
end

it "nilを追加するとエラーが発生すること" do
  cart = ShoppingCart.new
  expect{ cart.add nil}.to raise_error "Item is nil."
end

class Lottery
  KUJI = %w(あたり　はずれ　はずれ　はずれ)
  def initialize
    @result = KUJI.sample
  end
  def win?
    @result == "あたり"
  end
  def self.generate_results(count)
    Array.new(count){ self.new }
  end
end

it "当選確率が約25%になっていること" do
  results = Lottery.generate_results(10000)
  win_count = results.count($:win?)
  probablity = win_count.to_f / 10000 * 100

  expect(probability).to be_within(1.0).of(25.0)
end

class You
  def read_this_entry
    @matcher_expert = true
  end
  def matcher_expert?
    @matcher_expert
  end
end

describe You do
  describe '#read_this_entry' do
    let(:you) { You.new }
    it 'この記事を読むとマッチャを使いこなせるようになっていること' do
      expect{ you.read_this_entry }.to \
        change{ you.matcher_expert? }.from(be_falsey).to(be_truthy)
    end
  end
end

describe You do
  describe "#read_this_entry" do
    let(:you) { You.new }
    it "この記事を読むとマッチャを使いこなせるようになっていること" do
      expert{ you.read_this_entry }.to \
        change{ you.macher_expert? }.from(be_falsey).to(be_trurhy)
      end
    end
  end
end

require "twitter"

class WeatherBot
  def tweet_forecast
    twitter_client.update "今日は晴れです"
  end

  def tweet_client
    Twitter::REST::Client.new
  end
end

it "エラーなく予報をツイートすること" do
  weather_bot = WeatherBot.new
  expect{ weather_bot.tweet_forecast }.not_to raise_error
end

it "エラーなく予報をツイートすること" do
  twitter_client_mock = double("Twitter client")
  
  allow(twitter_client_mock).to receive(:update)
  # allow を使って呼び出し可能なメソッドをセットアップしたときは「呼び出されようと、呼び出されまいと知らんぷり」です。
  expect(twitter_client_mock).to receive(:update)
  # expect を使うと「そのメソッドが呼び出されないとテスト失敗」になります。

  # モックを使うときは、単に実装を置き換えたいだけなのか、それともメソッドの呼び出しも検証したいのかに応じて、 allow と expect を使い分ける必要があります。

  weather_bot = WeatherBot.new
  allow(weather_bot).to receive(:twitter_client).and_return(twitter_client_mock)

  expect{ weather_bot.tweet_forecast }.not_to raise_error
end


twitter_client_mock = double("Twitter client")
Rspec::Mocks::MockExpectationError: Double "Twitter client" received unexpected message :update with ("今日は晴れです")

allow(実装を置き換えたいオブジェクト).to receive(置き換えたいメソッド名).and_return(返却したい値やオブジェクト)

class WeatherBot
  def tweet_forecast
    twitter_client.update "今日は晴れです"
  rescue => e
    notify(e)
  end

  def tweet_client
    Twitter::REST::Client.new
  end

  def notify(error)
    #(エラーの通知を行う。実装は省略)
  end
end

it "エラーが起きたら通知すること" do
  twitter_client_mock = double("Twitter client")
  allow(twitter_client_mock).to receive(:update).and_raise("エラーが発生しました")
  weather_bot = WeatherBot.new
  allow(twitter_bot).to receive(:twitter_client).and_return(twitter_client_mock)
  expect(weather_bot).to receive(:notify)
  weather_bot.tweet_forecast
end

expect(weather_bot).to receive(:notify).once
expect(twitter_client_mock).to receive(:update).with("今日は晴れです")
expect(twitter_client_mock).to receive(:update).with('今日は晴れです').once
expect(user).to receive(:save_profile).with('Alice', 'alice@example.com')
expect(user).to receive(:save_profile).with('Alice', 'alice@example.com')
expect(user).to receive(:save_profile).with('Alice', anything)
expect(user).to receive(:save_profile).with(name: 'Alice', email: 'alice@example.com')
expect(user).to receive(:save_profile).with(hash_including(name: 'Alice'))

it "エラーなく予報をツイートすること" do
  twitter_client_mock = double("Twitter client")
  allow(twitter_client_mock).to receive(:update)
  allow_any_instance_of(WeatherBot).to receive(:twitter_client).and_return(twitter_client_mock)
  weather_bot = WeatherBot.new
  expect{ weather_bot.tweet_forecast }.not_to raise_error
end

class WeatherBot
  def search_first_weather_tweet
    twitter_client.search("天気").first.text
  end

  def tweet_forecast
    #(省略)
  end

  def twitter_client
    Twitter::REST::Client.new
  end
end

it "「天気」を含むツイートを返すこと" do
  status_mock = double("Status")
  allow(status_mock).to receive(:text).and_return('西脇市の天気は曇りです')
  twitter_client_mock = double("Twitter client")
  allow(twitter_client_mock).to receive(:search).and_return([status_mock])
  weather_bot = WeatherBot.new
  allow(weather_bot).to receive(:twitter_client).and_return(twitter_client_mock)
  expect(weather_bot.search_first_weather_tweet).to eq "西脇市の天気は曇りです"
end

it "「天気」を含むツイートを返すこと" do
  weather_bot = WeatherBot.new
  allow(weather_bot).to receive_message_chain("twitter_client.search.first.text").and_return("西脇市の天気は曇りです")
  expect(weather_bot.search_first_weather_tweet).to eq "西脇市の天気は曇りです"
end

it "エラーなく予報をツイートすること" do
  twitter_client_mock = double('Twitter client').as_null_object
  weather_bot = WeatherBot.new
  allow(weather_bot).to receive(:twitter_client).and_return(twitter_client_mock)
  expect{ weather_bot.tweet_forecast }.not_to raise_error
end

twitter_client_mock = double("Twitter client").as_null_object
# 子、孫、ひ孫・・・と永遠にメソッドの呼び出しが可能
twitter_client_mock.foo.bar.hoge.piyo

require "rails_helper"

feature "ログインとログアウト" do
  background do
    user.create!(email:"foo@example.com",password:"123456")
  end
  scenario "ログインする" do
    visit root_path
    fill_in "Email", with: "foo@example.com"
    fill_in "Password", with: "123456"
    click_on "ログイン"
    expect(page).to have_content "ログインしました"
  end
end

describe <=> feature
it <=> scenario
let <=> given
let! <=> given!
before <=> background

require "rails_helper"

describe "ログインとログアウト" do
  before do
    user.create!(email:"foo@example.com",password:"123456")
  end
  it "ログインする" do
    visit root_path
    fill_in "Email", with: "foo@example.com"
    fill_in "Password", with: "123456"
    click_on "ログイン"
    expect(page).to have_content "ログインしました"
  end
end

visit root_path
visit new_user_path

visit current_path

<input type="submit" name="commit" value="Save">
<button>Save</button>

click_button "Save"

click_link "New User"
<a href="/users/new">New User</a>

click_on "New User"
click_on "Save"

<a href="/users/new">New User</a>
<input type="submit" name="commit" value="Save">
<a><img alt="Alice" src="./profile.jpeg"></a>
<button><img alt="Alice" src="./profile.jpeg"></button>

click_on "Alice"

fill_in "タイトル", with: "あけましておめでとうございます"
<label for="blog_titile">タイトル</label>
<input type ="text" value="" name="blog[title]" id="blog_title">

<label for="japanese_calendar">和暦</label>
<select for="japanese_calendar" id="japanese_calendar">
  <option value="0">明治</option>
  <option value="1">大正</option>
  <option value="2">昭和</option>
  <option value="3">平成</option>
</select>

select "平成",from "和暦"

<label for="blog_titile">
  <input type ="checkbox" name="mailmagazine" id="mailmagazine" value="">
  メールマガジンを購読する
</label>

check "メールマガジンを購読する"
uncheck "メールマガジンを購読する"

choose "女性"
<label>
  <input id="user_sex_male" name="user[sex]" type ="radio"  value="male" checked="checked">
  男性
</label>
<label>
  <input id="user_sex_female" name="user[sex]" type ="radio"  value="female">
  女性
</label>

attach_file "プロフィール画像","#{Rails.root}/spec/factories/profile_image.jpg"

<input type ="hidden" name="secret_value" id="secret_value">

find("#secret_value",visible: false).set('secret!!')
<input type ="text" name="blog[title]" id="blog_title" value="" placeholder="ここにタイトルを入力します">
fill_in "タイトル", with: "あけましておめでとうございます"

<select for="japanese_calendar" id="japanese_calendar">
  <option value="0">明治</option>
  <option value="1">大正</option>
  <option value="2">昭和</option>
  <option value="3">平成</option>
</select>
select "平成",from "japanese_calendar"

<input type ="checkbox" name="mailmagazine" id="mailmagazine" value="" value="1">
check "mailmagazine"

<div class = "alert alert-success">
  ユーザーが作成されました
</div>

expect(page).to have_content "ユーザーが作成されました。"

<h1 class = "information" id="information">大事なお知らせ</h1>

expect(page).to have_selecter "h1", text:"大事なお知らせ"
expect(page).to have_selecter ".information", text:"大事なお知らせ"
expect(page).to have_selecter "#information", text:"大事なお知らせ"
expect(page).to have_selecter "h1.information", text:"大事なお知らせ"

<a href="contacts/1" data-method="delete">delete</a>
expect(page).to have_selecter "a[data-method="delete"]", text:"delete"
expect(page).to have_selecter h1, text: /^大事なお知らせ$/

<input type="submit" name="commit" value="Save">
expect(page).to have_button "Save"

<a href="/users/sign_up">会員登録はこちら</a>
expect(page).to have_link "会員登録はこちら"

