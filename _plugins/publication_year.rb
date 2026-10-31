Jekyll::Hooks.register :site, :post_read do |site|
  collection = site.collections["publications"]
  next unless collection

  collection.docs.each do |doc|
    year = doc.data["year"]
    if year && doc.data["date"].nil?
      doc.data["year"] = year.to_s
      doc.data["date"] = Time.utc(year.to_i, 1, 1)
    end
  end
end
