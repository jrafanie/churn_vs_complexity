require 'yaml'
require 'csv'
require 'parallel'

git_repo = ARGV[0]

def ignored?(file_path)
  return true unless file_path.end_with?(".rb")
  return true if file_path.start_with?("spec")
  return true if file_path.start_with?("test")
  return true if file_path.start_with?("db/migrate")
  return true unless File.file?(file_path)
  false
end

results = nil
Dir.chdir(git_repo) do
  yml = `churn -d "07/15/15" -y`
  changes = YAML.load(yml)[:churn][:changes]

  # run just the first 20 or so churn files
  # changes = changes[0..20]

  results = Parallel.map(changes, in_processes: 8) do |change|
    next if ignored?(change[:file_path])
    puts "file_path: #{change[:file_path]}"

    output = `flog -sq #{change[:file_path]}`
    flog_total = /([0-9]+\.[0-9]+): flog total/.match(output)[1]
    flog_method_avg = /([0-9]+\.[0-9]+): flog\/method average/.match(output)[1]
    puts "file_path: #{change[:file_path]}, changes: #{change[:times_changed]}, flog total: #{flog_total}, flog method avg: #{flog_method_avg}"
    [change[:file_path], change[:times_changed], flog_total, flog_method_avg]
  end

  # remove ignored files
  results.compact!
end

ui_csv      = CSV.open("./www/churn_vs_complexity_controllers_helpers.csv", "wb")
backend_csv = CSV.open("./www/churn_vs_complexity_backend.csv", "wb")
ui_csv << ["file", "churn", "total_complexity", "average_method_complexity"]
backend_csv << ["file", "churn", "total_complexity", "average_method_complexity"]

results.each do |r|
  if /app\/helpers|app\/controllers|app\/presenters/.match(r[0])
    ui_csv << r
  else
    backend_csv << r
  end
end

ui_csv.close
backend_csv.close
