require 'rails_helper'

# ①対象のクラス及びRSpecの種類を定義
RSpec.describe User, type: :model do

  # ②対象のメソッドなどを記載
  describe "#over_20_years_old?" do

    # ③テストの条件を記載
    context "20歳以上の場合" do

      # ⑤テストデータを作成しuser変数に入れる
      let!(:user) { FactoryBot.create(:user, age: 20) }

      # ④期待する実行結果を記載
      it "返り値はtrueであること" do

        # ⑥テストの実行結果を検証
        expect(user.over_20_years_old?).to be_truthy
      end
    end
  end

  describe ".ids_over_20_years_old" do
    let!(:user) { create(:user, age: 20) }

    # テストデータの作成
    before { create_list(:user, 2, age: 19) }

    it "20歳以上のユーザーIDのみ取得できること" do
      expect(User.ids_over_20_years_old).to match_array [user.id]
    end
  end
end
