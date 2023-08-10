# k_dorama_review

## k_dorama_reviewの概要
k_dorama_reviewは韓国ドラマに特化したレビューサイトです。
レビューを通じて自分に合った韓国ドラマを見つけるのが主目的です。
また任意で感想だけではなく、このドラマが向いている人、向いていない人も
記載することが可能です。

## システム構成図
[erd-2.pdf](https://github.com/osugitaro/k_dorama_review/files/12307543/erd-2.pdf)

## 使っている技術
- Ruby 3.1.2
- Ruby on Rails 6.1.7.4
- sqlite3 1.6.3-x86_64-darwin
- puma 5.6.6
- rspec-rails 6.0.3
- capybara 3.39.2
- rubocop 1.32.0

## 機能一覧
- ユーザー登録、ログイン機能(devise)
- 画像アップロード、表示機能(active storage)
- いいね機能(Ajax)
- ページネーション機能(kaminari)
- 検索機能(ransack)

## テスト
RSpec
- 単体テスト(model)
- 統合テスト(systemspec)

## こだわったポイント
こだわったポイントはドラマのレビューだけでなく、おすすめな人、おすすめでない人、挫折した人の意見も載せた点です。

### 次に見るドラマを決めるのは結構大変
見るドラマを決めるのって結構エネルギーが入りませんか？

1話で大体1時間位あるし、それが10話前後ある。本当に面白いと感じるドラマだったら苦にはならないと思います。
でも自分にとっての面白いドラマって本当に向き不向きあがありますよね。

絶賛されているドラマだけど面白いと感じない。でも、いつかは面白くなるかも・・・。
そして結局最後まで見るも面白いと感じなかった。こんな経験はないでしょうか？

### 自分に合ったドラマを見つけるために
自分に合ったドラマを見つけるために、このアプリではレビューだけではなく
このドラマがおすすめな人、おすすめではない人、また挫折した人の意見も投稿可能になっています。

このアプリを通じて効率よく自分に合ったドラマを見つけてもらいたいです。

### 使い方デモ
上記はアプリのデモ動画です。
![k_dorama_demo](https://github.com/osugitaro/k_dorama_review/assets/118638450/9b7f5f3b-9eb4-4ecb-964b-29afd0bc48d7)




