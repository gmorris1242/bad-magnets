# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://www.badmagnets.com"
SitemapGenerator::Sitemap.compress = false

SitemapGenerator::Sitemap.create do
  routes = Rails.application.routes.routes.map do |route|
    {
      alias: route.name,
      path: route.path.spec.to_s,
      controller: route.defaults[:controller],
      action: route.defaults[:action]
    }
  end

  routes.reject! { |route| route[:path] == '/' }

  routes.uniq! { |route| route[:path] }

  skip_strings  = ['rails','email_list']

  routes.reject! do |route|
    skip_strings.any? { |skip_string| route[:path].include?(skip_string) }
  end

  routes.each do |route|
    add route[:path][0..-11]
  end
end
