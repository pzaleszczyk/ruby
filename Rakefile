task default: %w[test]

task :test do
  bundle exec parallel_test test/*.rb
  ruby "parallel_test"
end
