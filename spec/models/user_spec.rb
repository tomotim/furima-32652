require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context 'ユーザー登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmation、first_name、last_name、first_name_kana、last_name_kana、birth_date、が存在すれば登録できる" do
        expect(@user).to be_valid
      end

      it "passwordが6文字以上、英数字混合で登録できる" do
        @user.password = "aaaa77"
        @user.password_confirmation = @user.password
        expect(@user).to be_valid
      end
    end

    context 'ユーザー登録できない時' do
      it "nicknameが空では登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
        
      it "メールアドレスが一意性であること" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "メールアドレスは、@を含む必要があること" do
        @user.email = "testcom"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "パスワードが必須であること" do
        @user.password = ""
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank", "Password is invalid")
      end

      it "パスワードは、6文字以上での入力が必須であること" do
        @user.password = "suno3"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "パスワードは半角英数字混合での入力が必須であり、数字のみでは登録できない" do
        @user.password = "222222"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "パスワードは半角英数字混合での入力が必須であり、全角では登録できない" do
        @user.password = "ｐａｓｕｗａ－ｄｏ６３"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      
      it "パスワードは、半角英数字混合での入力が必須であること" do
        @user.password = "password"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "パスワードは、確認用を含めて2回入力すること" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      
      it "パスワードとパスワード（確認用）、値の一致が必須であること" do
        @user.password_confirmation = "tesu42"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end 

      it "ユーザー本名の名字は必須であること" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      
      it "ユーザー本名の名前は必須であること" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it "ユーザー本名の名字は、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
        @user.first_name = "yone"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name に全角文字を使用してください")
      end

      it "ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
        @user.last_name = "yone"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name に全角文字を使用してください")
      end

      it "ユーザー本名のフリガナの名字は必須であること" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it "ユーザー本名のフリガナの名前で必須であること" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it "ユーザー本名名字のフリガナはカタカナ以外受け付けないこと" do
        @user.first_name_kana = "かな"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana 全角カタカナのみで入力して下さい")
      end

      it "ユーザー本名名前のフリガナはカタカナ以外受け付けないこと" do
        @user.last_name_kana = "かな"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana 全角カタカナのみで入力して下さい")
      end


      it "生年月日が必須であること" do
        @user.birth_date = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end