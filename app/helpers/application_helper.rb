module ApplicationHelper
  def default_meta_tags
    {
      site: 'k_dorama_review',
      title: '',
      reverse: true,
      charset: 'utf-8',
      description: '韓国ドラマに特化したレビューサイトです。レビューのみならず、そのドラマがどういう人におすすめか、おすすめではないかも
      投稿可能になっているため、自分に合った韓国ドラマが見つかりやすくなります。',
      canonical: request.original_url,
      separator: '|',
      og: {
        site_name: 'k_dorama_review',
        title: :full_title,
        url: request.url,
      },
      twitter: {
        card: 'summary_large_image',
      },
    }
  end
end
