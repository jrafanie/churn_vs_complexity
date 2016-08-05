www = File.expand_path(File.join(File.dirname(__FILE__), "www"))

run Proc.new { |env|
  req = Rack::Request.new(env)
  index_file = File.join(www, req.path_info, "index.html")

  if File.exists?(index_file)
    req.path_info += "index.html"
  end

  Rack::Directory.new(www).call(env)
}
