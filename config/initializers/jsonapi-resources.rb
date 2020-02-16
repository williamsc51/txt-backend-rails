JSONAPI.configure do |config|
  # Metadata
  # Output record count in top level meta for find operation
  config.top_level_meta_include_record_count = true
  config.top_level_meta_record_count_key = :record_count

  config.top_level_meta_include_page_count = true
  config.top_level_meta_page_count_key = :page_count
end