require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  before do
    @restaurant = Restaurant.new(name: "パスタ食堂", photo: "pasta.jpg", address: "〒120-0034 東京都足立区千住１丁目２０", lat: 35.74844310, lng: 139.8014340)
  end

  describe 'nameバリデーション' do
    it "1文字はOK" do
      @restaurant.name = 'a'
      expect(@restaurant.valid?).to eq(true)
    end

    it "50文字はOK" do
      @restaurant.name = 'a' * 50
      expect(@restaurant.valid?).to eq(true)
    end

    it "空ならNG" do
      @restaurant.name = nil
      expect(@restaurant.valid?).to eq(false)
    end

    it "51文字以上ならNG" do
      @restaurant.name = 'a' * 51
      expect(@restaurant.valid?).to eq(false)
    end
  end

  describe 'photoバリデーション' do
    it "5文字はOK" do
      @restaurant.photo = 'a' + '.jpg'
      expect(@restaurant.valid?).to eq(true)
    end

    it "50文字はOK" do
      @restaurant.photo = 'a' * 50
      expect(@restaurant.valid?).to eq(true)
    end

    it "空ならNG" do
      @restaurant.photo = nil
      expect(@restaurant.valid?).to eq(false)
    end
    
    it "4文字以内ならNG" do
      @restaurant.photo = '' + '.jpg'
      expect(@restaurant.valid?).to eq(false)
    end
    
    it "51文字以上ならNG" do
      @restaurant.photo = 'a' * 51
      expect(@restaurant.valid?).to eq(false)
    end
  end
  
  describe 'addressバリデーション' do
    it "1文字はOK" do
      @restaurant.address = 'a' 
      expect(@restaurant.valid?).to eq(true)
    end
    
    it "50文字はOK" do
      @restaurant.address = 'a' * 50
      expect(@restaurant.valid?).to eq(true)
    end

    it "空ならNG" do
      @restaurant.address = nil
      expect(@restaurant.valid?).to eq(false)
    end
    
    it "51文字以上ならNG" do
      @restaurant.address = 'a' * 51
      expect(@restaurant.valid?).to eq(false)
    end
  end
end
