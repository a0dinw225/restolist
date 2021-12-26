require 'rails_helper'

RSpec.describe Like, type: :model do
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
end
