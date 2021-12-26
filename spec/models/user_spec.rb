require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.new(name: "user", email: "user@example.com", password: "password", password_confirmation: "password")
  end

  describe 'nameバリデーション' do
    it "1文字はOK" do
      @user.name = 'a'
      expect(@user.valid?).to eq(true)
    end

    it "50文字はOK" do
      @user.name = 'a' * 50
      expect(@user.valid?).to eq(true)
    end

    it "空ならNG" do
      @user.name = nil
      expect(@user.valid?).to eq(false)
    end

    it "51文字以上ならNG" do
      @user.name = 'a' * 51
      expect(@user.valid?).to eq(false)
    end
  end

  describe 'emailバリデーション' do
    it '255文字以内ならOK' do
      @user.email = 'a' * 243 + '@example.com'
      expect(@user.valid?).to eq(true)
    end

    it 'メールアドレスがsave後に小文字化されていること' do
      @user.email = 'USER@EXamplE.Com'
      @user.save
      expect(@user[:email]).to eq('user@example.com')
    end
    
    it '空ならNG' do
      @user.email = nil
      expect(@user.valid?).to eq(false)
    end

    it '256文字以上ならNG' do
      @user.email = 'a' * 244 + '@example.com'
      expect(@user.valid?).to eq(false)
    end

    it '無効なメールアドレスならOK' do
      @user.email = 'user.name@example.'
      expect(@user.valid?).to eq(false)
    end
  end

  describe 'passwordバリデーション' do
    it '6文字以上ならOK' do
      @user.password_confirmation = @user.password = 'aaaaaa'
      expect(@user.valid?).to eq(true)
    end
    
    it '空ならNG' do
      @user.password_confirmation = @user.password = nil
      expect(@user.valid?).to eq(false)
    end
    
    it '5文字以内ならNG' do
      @user.password_confirmation = @user.password = 'aaaaa'
      expect(@user.valid?).to eq(false)
    end
  end

end
