# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Activity.destroy_all
Activity.insert_all([
  { id: 1, activity: 'レジぶくろをもらわない' }, 
  { id: 2, activity: 'マイエコバッグを使う' }, 
  { id: 3, activity: 'マイはしを持ち歩く' }, 
  { id: 4, activity: 'いらなくなったものを他の人にゆずる' }, 
  { id: 5, activity: '分べつしてごみをすてる' }, 
  { id: 6, activity: 'リサイクルされた物を買う' },
  { id: 7, activity: 'ごみ拾いにさんかする' }, 
  { id: 8, activity: 'ペットボトルのキャップとラベルをはずして分べつする' }, 
  { id: 9, activity: 'こわれたものはしゅうりして使う' }, 
  { id: 10, activity: '「もったいない」をさがす' }, 
  { id: 11, activity: '近くの場所に行くときは自転車に乗る' }, 
  { id: 12, activity: '近くの場所に行くときは歩く' }, 
  { id: 13, activity: '電車に乗る' }, 
  { id: 14, activity: 'バスに乗る' }, 
  { id: 15, activity: '「生物多様性」についてまわりの人と話す' }, 
  { id: 16, activity: '「地球温暖化」についてまわりの人と話す' }, 
  { id: 17, activity: '「ごみ問題」についてまわりの人と話す' }, 
  { id: 18, activity: '「絶めつ危ぐ種」についてまわりの人と話す' }, 
  { id: 19, activity: '「３Ｒ」についてまわりの人と話す' }, 
  { id: 20, activity: '「オゾンそう」について周りの人とはなす' }, 
  { id: 21, activity: '「砂ばく化」についてまわりの人と話す' }, 
  { id: 22, activity: 'ごはんをのこさず全部食べる' }, 
  { id: 23, activity: 'お皿のよごれをいらない紙でふきとってからあらう' }, 
  { id: 24, activity: 'シャワーの時間を短くする' }, 
  { id: 25, activity: '水をだしっぱなしにしないようにする' }, 
  { id: 26, activity: 'テレビを見る時間をいつもより少なくする' }, 
  { id: 27, activity: '使わない電気をこまめに消す' }, 
  { id: 28, activity: 'れいぞう庫をあけっぱなしにしないようにする' }, 
  { id: 29, activity: 'エアコンのフィルターをそうじする' }, 
  { id: 30, activity: '緑のカーテンを作る' }, 
  { id: 31, activity: '家族と同じ部屋ですごす' }, 
  { id: 32, activity: '寒いときはもう１まいふくを着る' }, 
  { id: 33, activity: '寒いときはあたたかいものを食べる' }, 
  { id: 34, activity: '暑いときは上着をぬぐ' }, 
  { id: 35, activity: '夏はエアコン温度を２８℃にする' }, 
  { id: 36, activity: '冬はエアコン温度を２０℃にする' }
])


