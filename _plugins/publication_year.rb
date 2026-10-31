Jekyll::Hooks.register :documents, :post_read do |doc|
  next unless doc.collection&.label == "publications"

  year = doc.data["year"]
  if year && doc.data["date"].nil?
    doc.data["year"] = year.to_s
    doc.data["date"] = Time.utc(year.to_i, 1, 1)
  end
end
