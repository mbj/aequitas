source 'https://rubygems.org'

gemspec

gem 'adamantium',          :git => 'https://github.com/dkubb/adamantium.git'
gem 'descendants_tracker', :git => 'https://github.com/dkubb/descendants_tracker.git'
gem 'abstract_class',      :git => 'https://github.com/dkubb/abstract_class.git'
gem 'equalizer',           :git => 'https://github.com/dkubb/equalizer.git'

group :development do
  gem 'rake',        '~> 0.9.2'
  gem 'yard',        '~> 0.8.1'
  gem 'rspec',       '~> 2'
  gem 'rspec-mocks', '~> 2'
end

group :guard do
  gem 'guard',         '~> 1.5.4'
  gem 'guard-bundler', '~> 1.0.0'
  gem 'guard-rspec',   '~> 1.2.1'
  # Remove this once https://github.com/nex3/rb-inotify/pull/20 is solved.
  # This patch makes rb-inotify a nice player with listen so it does not poll.
  gem 'rb-inotify', :git => 'https://github.com/mbj/rb-inotify'
end

group :metrics do
  gem 'flay',            '~> 1'
  gem 'flog',            '~> 2'
  gem 'reek',            '~> 1'
  gem 'roodi',           '~> 2'
  gem 'yardstick',       '~> 0'
  gem 'yard-spellcheck', '~> 0'
  gem 'pelusa',          '~> 0'
end
