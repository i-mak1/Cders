class Contact < ApplicationRecord

belongs_to :enduser
# replyが空かどうかでバリデーションをかける、空ならユーザー、違えば管理者。
validates :contact, presence: true, if: :is_enduser?
validates :reply, presence: true, unless: :is_enduser?

private
# ユーザーか否かを判断するメソッド。replyが空の場合はユーザーと判断し、contactにのみバリデーションが働く。
def is_enduser?
	self.reply.nil?
end

end
