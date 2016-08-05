root = File.expand_path(File.join(File.dirname(__FILE__), "www"))

run Proc.new { |env|
  Rack::Directory.new(root).call(env)
}
