module ApiFilters
  BookFilters = Rack::Reducer.new(
    Book.all,
    ->(title:) { where('lower(title) like ?', "%#{title.downcase}%") },
    ->(category:) { where('lower(category) like ?', "%#{category.downcase}%") },
    ->(author:) { where('lower(author) like ?', "%#{author.downcase}%") },
    ->(limit:) { Book.limit(limit) },
    ->(fields:) { as_json(only: fields.split(',')) }
  )
end
