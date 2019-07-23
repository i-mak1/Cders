class Contact < ApplicationRecord

belongs_to :enduser
# コンタクトに紐づくエンドユーザーが存在しない時（管理者による問い合わせ）バリデーションを実行する。
validates :contact, presence: true, unless: :is_admin?
validates :reply, presence: true, if: :is_admin?

private
# 管理者か否かを判断するメソッド。コンタクトに紐づくエンドユーザーが存在しない場合は管理者と判断する。
def is_admin?
	self.enduser.nil?
end

end
