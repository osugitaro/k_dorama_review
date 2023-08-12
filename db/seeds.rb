Admin.create!([
  {email: "akio.rainbow@icloud.com", password: "kotaro0929",}
])
User.create!([
  {email: "akio.rainbow@icloud.com", password: "tuwi0929",  name: "こた"},
  {email: "neko@gmail.com", password: "neko0929", name: "にゃんた"},
  {email: "nana@gmail.com", password: "nana0929",  name: "なな子"},
  {email: "gonda@icloud.com", password: "gonda0929",  name: "マイケル"},
  {email: "seroi@gmail.com", password: "seroi0929", name: "serori"}
])
Comment.create!([
  {comment: "どこが分かりづらかったですか？", user_id: 37, review_id: 3, parent_id: nil}
])
KDorama.create!([
  {title: "梨泰院クラス", introduction: "父親と二人暮らしのセロい。\r\n曲がったことが嫌いで、自分が決めたことは貫き通す正確。\r\n父親と二人、幸せに飲食店を営んでいたが、ある日、父親がひき逃げ事故にあい亡くなってしまう。\r\n何の気力もなくなってしまったセロイ。\r\nしかしひき逃げ事故の犯人の父親と会合したことで、復讐することを胸に誓いはじめる。\r\n\r\n圧倒的な権力へと立ち向かいながら、自分の居酒屋を韓国No. 1の企業へとするべく奮闘するサクセスストーリー。", genre: "復讐系"},
  {title: "VAGABOND", introduction: "民間旅客機の墜落事故で甥を亡くしてしまったチャン・ダルゴン。しかし彼は事故ではなくテロではないかと疑い始める。やがてそれは巨大な国の陰謀へと繋がっていく\r\n", genre: "アクション系"},
  {title: "キム秘書は一体なぜ？", introduction: "容姿、頭脳共に完璧な大企業の副会長のイ・ヨンジュン。\r\nそんな彼を9年間、支えてきた秘書のキム・ミソ。しかし\r\nある日彼女から、恋や結婚をして自分の人生を歩んでいきたいと辞職を宣言される。\r\nどうしても引き止めたいヨンジュンはプロポーズまでもするが・・・。\r\n", genre: "ラブコメ系"},
  {title: "マイディアミスター", introduction: "3人兄弟の次男坊であるパク・ドンフン。\r\n彼の性格は、とても真面目。\r\n高学歴にも関わらず、職につかない兄や弟とは違い\r\n大企業で働いている。\r\n妻子にも恵まれ、順風満帆の人生に見える。\r\nしかし彼は真面目で事なかれ主義な性格のため、生きづらい毎日を送っていた。\r\nそんなある時、ドンフンは会社で自分の机の中で大金が入った封筒を見つける。\r\n賄賂だとすぐに判断し、慌てて隠すドンフンだが、それを見ていた女性がいて・・・\r\n", genre: "感動系"},
  {title: "太陽の末裔", introduction: "軍の任務を終え、久方ぶりの休みを満喫していたシジンとデヨンは、逃走中の窃盗犯と遭遇する。犯人を捕らえるが、怪我をさせてしまったため救急車に乗せることに。しかし救急車に乗せる時に、こっそり犯人がデヨンの携帯を盗んでしまう。あとから気づいたシジンとデヨンは犯人が搬送された病院に行くことになる。そこでシジンは美人な女医モヨンに出会い、一目惚れをしてしまう。", genre: "感動系　"},
  {title: "悪の花", introduction: "金属工芸家のペク・ヒソンは妻のジウォンと可愛い娘ウナに囲まれ、平凡であるが幸せな毎日を送っていた。ある日、成り行きでジウォンに知り合いの記者キム・ムジンを紹介される。ムジンは18年前の連続殺人犯の真相を追っている記者。偶然にも事件の犯人と同じ職業、金属工芸家であるヒソンに興味を持ち、工房へと訪れる。しかし、そこでヒソンの顔を見たムジンは事件の犯人の息子ト・ヒョンスではないかと疑い始める。\r\nそんな中、事件の情報を持つ男が殺される事件が発生。\r\n事件の担当になった妻のジウォンは事件を追う中、夫の不可解な行動に疑念を抱き始めてしまう。\r\n", genre: "サスペンス系"}
])
Like.create!([
  {user_id: 39, review_id: 2},
  {user_id: 39, review_id: 3},
  {user_id: 37, review_id: 2},
  {user_id: 41, review_id: 2},
  {user_id: 37, review_id: 3}
])
Review.create!([
  {k_dorama_id: 7, user: nil, references: nil, impression: "自分は1話で挫折してしまいました。\r\n雰囲気が重いのと、あまり面白くなりそうにないなと思ったからです。", user_id: "38", evaluation: 2.0, recommendation: "暗い話でも良いよって方にはおすすめかもしれません。\r\nあと他の作品と違ったIUちゃんが見れるので、IUちゃんのファンにはおすすめです。", not_recommendation: "重い雰囲気のドラマが好きではない方。\r\nあと自分は1話しか見ていませんが、このドラマ最初から面白い話ではないと思います。\r\nなので最初から面白いドラマが良い人には向いていないかもしれません。", viewing_status: "frustration"},
  {k_dorama_id: 7, user: nil, references: nil, impression: "感動しました！\r\nですが、個人的によく分かりづらいとこも沢山あり。。。\r\nもうちょっと分かりやすいと良かったかなと思います。", user_id: "39", evaluation: 4.0, recommendation: "感動したい作品を探している人にはおすすめです。\r\nあとIUが可愛いのもあったんですが、個人的におじさん役のイ・ソンギュン\r\nの声がイケボすぎて・・・\r\n今よく言われているイケおじが見たいならおすすかもしれません！", not_recommendation: "よく言われていることですが最初はつまらないです・・・\r\nなので前半は我慢が必要です。\r\nあと結構比喩表現？みたいなものも使うので、心情が分かりづらくて\r\nこれどういうこと？ってことが私は多々ありました。\r\nそういうのが嫌いな人は向いていないかもです。", viewing_status: "saw_all"}
])
ActiveStorage::Attachment.create!([
  {name: "image", record_type: "KDorama", record_id: 4, blob_id: 9},
  {name: "image", record_type: "KDorama", record_id: 5, blob_id: 12},
  {name: "image", record_type: "KDorama", record_id: 6, blob_id: 14},
  {name: "image", record_type: "KDorama", record_id: 7, blob_id: 16},
  {name: "image", record_type: "KDorama", record_id: 8, blob_id: 17},
  {name: "image", record_type: "KDorama", record_id: 9, blob_id: 18},
  {name: "image", record_type: "User", record_id: 37, blob_id: 19},
  {name: "image", record_type: "User", record_id: 38, blob_id: 20},
  {name: "image", record_type: "User", record_id: 39, blob_id: 21},
  {name: "image", record_type: "User", record_id: 40, blob_id: 22}
])
ActiveStorage::Blob.create!([
  {key: "t4crif4alcbxdqlxqrd3imbbxeqz", filename: "635d1b4a239e2841c5a9557cd1fa4150.jpeg", content_type: "image/jpeg", metadata: {"identified"=>true, "analyzed"=>true}, service_name: "local", byte_size: 37988, checksum: "KXnOhAmJGOPePcaZ0G5WCw=="},
  {key: "0cd1gskiu14wssdm19dtjdxy3i0j", filename: "イテオンクラス.jpg", content_type: "image/jpeg", metadata: {"identified"=>true, "analyzed"=>true}, service_name: "local", byte_size: 199855, checksum: "CopVWp4t6wNSbqHgvRTftw=="},
  {key: "dm2wah9bfl4c2sonxkd3t4ayt0a7", filename: "79439243-8551-4930-BCAA-167ABA26FA7B_4_5005_c.jpeg", content_type: "image/jpeg", metadata: {"identified"=>true, "analyzed"=>true}, service_name: "local", byte_size: 78453, checksum: "F1OG0RaQO8QE6BjxWCnkKw=="},
  {key: "6435w2gxkum2rwkyhmdu3i4mjmom", filename: "UNaPGljtCDwf3pg1687277996_1687278023.jpg", content_type: "image/jpeg", metadata: {"identified"=>true, "analyzed"=>true}, service_name: "local", byte_size: 33319, checksum: "TRmZfgLu8w2rKjN8VxxDqQ=="},
  {key: "i23v8fjxvqnwyja10aky5a6kpkyy", filename: "W3wuA2k5yesyxZa1687278485_1687278491.jpg", content_type: "image/jpeg", metadata: {"identified"=>true, "analyzed"=>true}, service_name: "local", byte_size: 134729, checksum: "tXq9sjEGBQxd8WG6BFNVcg=="},
  {key: "g6vtksgeqaklfoper4ayluipyhc2", filename: "41Fuq4-hePL._SL500_.jpg", content_type: "image/jpeg", metadata: {"identified"=>true, "analyzed"=>true}, service_name: "local", byte_size: 23917, checksum: "q/bpLd2FAa1rIBFFn+mMtQ=="},
  {key: "rnuuq4o9atxbnam1nowzaehetwpm", filename: "71MGSegPmaL._AC_SL1087_.jpg", content_type: "image/jpeg", metadata: {"identified"=>true, "analyzed"=>true}, service_name: "local", byte_size: 129743, checksum: "0jXxUiuZgCwQIqmumUtFUw=="},
  {key: "9f97q0g39xx3k85rf4m53ydbck9v", filename: "akunohana-main.jpeg", content_type: "image/jpeg", metadata: {"identified"=>true, "analyzed"=>true}, service_name: "local", byte_size: 80435, checksum: "xrdE3K7/UIrB20WvKeZ4IA=="},
  {key: "o98a0lxccsv1tqo8qvrgvjg436j8", filename: "豆腐さん-1-1024x1024.png", content_type: "image/png", metadata: {"identified"=>true, "analyzed"=>true}, service_name: "local", byte_size: 76428, checksum: "nNSbbXz6o/PJ1XNJ+dPegA=="},
  {key: "ynziojr0vdd0peap9bjlerxg3hbg", filename: "1007193009_5bb9e03185cb4.jpeg", content_type: "image/jpeg", metadata: {"identified"=>true, "analyzed"=>true}, service_name: "local", byte_size: 371854, checksum: "NwehEPIWc2syAgjRLiOUng=="},
  {key: "qo4s0az5ukjue8cmjz3mkbluxqj7", filename: "アイコン05.png", content_type: "image/png", metadata: {"identified"=>true, "analyzed"=>true}, service_name: "local", byte_size: 227143, checksum: "qgc7hnkp4xPvrspRZK8YZw=="},
  {key: "bibkekkih8unl853kit5n1n7bz6l", filename: "face_smile_man2.png", content_type: "image/png", metadata: {"identified"=>true, "analyzed"=>true}, service_name: "local", byte_size: 217394, checksum: "D6MgwF6FfmVEkqV5PBnw/A=="}
])
