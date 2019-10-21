task default: %w[test]

task :test do
  find test -name 'test/*.rb' | xargs -t bundle exec ruby -I.:test -e "ARGV.each{|f| require f}"
end
