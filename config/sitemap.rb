# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.markhoad.com"

SitemapGenerator::Sitemap.create do
  # add categories_path, priority: 0.5, changefreq: 'daily'
  # add category_posts_path, priority: 0.9, changefreq: 'daily'

  Category.find_each do |category|
    add category_path(category), priority: 0.7, changefreq: 'daily'
  end

  Post.find_each do |post|
    add category_post_path(post.category, post), lastmod: post.updated_at, 
                          changefreq: 'weekly', priority: 0.9
  end

  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
end
