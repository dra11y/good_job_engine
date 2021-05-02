source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Specify your gem's dependencies in good_job_engine.gemspec
gemspec

gem 'appraisal', github: "excid3/appraisal", branch: "fix-bundle-env" # https://github.com/thoughtbot/appraisal/pull/174
gem 'pg', platforms: [:mri, :mingw, :x64_mingw]
gem 'rails'

platforms :ruby do
  gem "memory_profiler"
  gem "pry-byebug"
  gem "rbtrace"

  group :lint do
    gem "erb_lint", ">= 0.0.35"
    gem "mdl"
    gem "rubocop"
    gem "rubocop-performance"
    gem "rubocop-rails"
    gem "rubocop-rspec"
  end
end
