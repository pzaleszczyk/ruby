task default: %w[test]

task :test do
  find test -name '*_test.rb' | xargs -t bundle exec ruby -I.:test -e "ARGV.each{|f| require f}"
end
