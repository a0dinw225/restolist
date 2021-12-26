require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    user = User.create(name: "user", email: "user@example.com", password: "password", password_confirmation: "password")
    restaurant = Restaurant.create(name: "パスタ食堂", photo: "pasta.jpg", address: "〒120-0034 東京都足立区千住１丁目２０", lat: 35.74844310, lng: 139.8014340)
    @post = Post.new(user_id: user.id, restaurant_id: restaurant.id, content: "aaaa")
  end
  
  # 関連付けのテスト
  describe 'Association' do
    let(:association) do
       # reflect_on_associationで対象のクラスと引数で指定するクラスの
       # 関連を返す
       described_class.reflect_on_association(target)
    end

    # userとの関連付けをチェックしたい場合
    context "user" do
      let(:target) { :user }
      it { expect(association.macro).to eq :belongs_to }
      it { expect(association.class_name).to eq 'User' }
    end
    
    # restaurantとの関連付けをチェックしたい場合
    context "restaurant" do
      let(:target) { :restaurant }
      it { expect(association.macro).to eq :belongs_to }
      it { expect(association.class_name).to eq 'Restaurant' }
    end
  end
  
  describe 'contentバリデーション' do
    it "1文字はOK" do
      @post.content = 'a'
      expect(@post.valid?).to eq(true)
    end
    
    it "140文字ならOK" do
      @post.content = 'a' * 140
      expect(@post.valid?).to eq(true)
    end
    
    it "空ならNG" do
      @post.content = nil
      expect(@post.valid?).to eq(false)
    end
    it "141文字ならNG" do
      @post.content = 'a' * 141
      expect(@post.valid?).to eq(false)
    end
  end
end
