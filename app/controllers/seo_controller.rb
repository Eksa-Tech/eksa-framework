class SeoController < Eksa::Controller
  def robots
    content = <<~TEXT
      User-agent: *
      Allow: /
      Disallow: /hapus
      Disallow: /edit
      
      Sitemap: https://#{request.host}/sitemap.xml
    TEXT
    [200, { "Content-Type" => "text/plain" }, [content]]
  end

  def sitemap
    lastmod = Time.now.strftime("%Y-%m-%d")
    
    xml = '<?xml version="1.0" encoding="UTF-8"?>'
    xml += '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">'
    
    ["/", "/about", "/docs", "/kontak"].each do |path|
      xml += "<url>"
      xml += "<loc>https://#{request.host}#{path}</loc>"
      xml += "<lastmod>#{lastmod}</lastmod>"
      xml += "<priority>0.8</priority>"
      xml += "</url>"
    end
    
    xml += '</urlset>'
    [200, { "Content-Type" => "application/xml" }, [xml]]
  end
end