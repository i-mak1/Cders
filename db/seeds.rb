# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Genre.create(
[
	{genre_name: 'J-POP'},
	{genre_name: '洋楽'},
	{genre_name: 'K-POP'},
	{genre_name: 'ロック'},
	{genre_name: 'パンク'},
	{genre_name: 'ビジュアル'},
	{genre_name: 'R&B/ソウル'},
	{genre_name: 'ヒップホップ'},
	{genre_name: 'ダンス'},
	{genre_name: 'レゲエ'},
	{genre_name: 'EDM'}
]
)