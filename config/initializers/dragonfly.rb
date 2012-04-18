require 'dragonfly'

imagefly = Dragonfly[:images]
imagefly.configure_with(:imagemagick)
imagefly.configure_with(:rails)

imagefly.define_macro(ActiveRecord::Base, :image_accessor)
imagefly.datastore = Dragonfly::DataStorage::S3DataStore.new

imagefly.datastore.configure do |c|
  c.bucket_name = 'new-venture-prep'
  c.access_key_id = '1CX1S31H918CDZ9AQ182'
  c.secret_access_key = '0pP7Fs9RVMxZKWB1xYwZAUSQdToUB5h/0q9QIMC0'
  c.storage_headers = {'x-amz-acl' => 'public'} 
  # c.url_scheme = 'https'
  # c.url_host = 'd3ffpb4sumecqx.cloudfront.net'
end

swfly = Dragonfly[:swf]
swfly.configure_with(:rails)
swfly.define_macro(ActiveRecord::Base, :swf_accessor)
swfly.datastore = imagefly.datastore