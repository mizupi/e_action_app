# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Activity.destroy_all
Activity.insert_all([
  { id: 1, act_name: 'レジぶくろをもらわない' }, 
  { id: 2, act_name: 'マイエコバッグを使う' }, 
  { id: 3, act_name: 'マイはしを持ち歩く' }
])


