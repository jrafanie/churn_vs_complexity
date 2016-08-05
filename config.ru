www = File.expand_path(File.join(File.dirname(__FILE__), 'www'))

run proc { |env|
  req = Rack::Request.new(env)
  index_file = File.join(www, req.path_info, 'index.html')

  req.path_info += 'index.html' if File.exist?(index_file)

  Rack::Directory.new(www).call(env)
}
