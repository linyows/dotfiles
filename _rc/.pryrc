# Pry Config
Pry.config.commands.import Pry::ExtendedCommands::Experimental
Pry.config.pager = false
Pry.config.editor = 'vim'
Pry.config.history.should_save = true
Pry.config.history.file = '~/.dotfiles/history/.pry_history'

rails_env = defined?(::Rails) ?
  "#{Rails.env.production? ? "\033[7;31m#{Rails.env}\033[0m" : 'dev'} " : nil
info = "#{rails_env}#{RUBY_VERSION}"
Pry.prompt = [
  proc { |target_self, nest_level, pry|
    number = pry.input_array.size
    target = Pry.view_clip(target_self)
    level = nest_level.zero? ? nil : ":#{nest_level}"
    sep = "\033[1;34m|\033[0m"
    prompt = "\033[1;34m>\033[0m"
    "#{number} #{sep} #{info}(#{target})#{level}#{prompt} "
  },
  proc { |target_self, nest_level, pry|
    number = pry.input_array.size
    target = Pry.view_clip(target_self)
    level = nest_level.zero? ? nil : ":#{nest_level}"
    sep = "|"
    prompt = "*"
    "#{number} #{sep} #{info}(#{target})#{level}#{prompt} "
  }
]

# Toys methods
# See https://gist.github.com/807492
class Array
  def self.toy(n = 10, &block)
    block_given? ? Array.new(n, &block) : Array.new(n){ |i| i + 1 }
  end
end

class Hash
  def self.toy(n = 10)
    Hash[Array.toy(n).zip(Array.toy(n){ |c| (96 + (c + 1)).chr })]
  end
end

def h; { hello: 'world', free: 'of charge' }; end
def beep; putc ?\a; nil; end
def d; rand(4) + 1; end

## Benchmarking
# Inspired by <http://stackoverflow.com/questions/123494/whats-your-favourite-irb-trick/123834#123834>.
def time(repetitions = 100, &block)
  require 'benchmark'
  Benchmark.bm{|b| b.report{repetitions.times(&block)}}
end

if defined?(::Rails) && Rails.env
  # require 'logger'
  # ActiveRecord::Base.logger = Logger.new(STDOUT)
  # ActiveRecord::Base.clear_active_connections!

  # require_without_bundler 'hirb'
  # # https://github.com/cldwalker/hirb/issues/46#issuecomment-1870823
  # Pry.config.print = proc do |output, value|
    # Hirb::View.view_or_page_output(value) || Pry::DEFAULT_PRINT.call(output, value)
  # end
  # Hirb.enable

  class Class
    def core_ext
      self.instance_methods.map{ |m|
        [m, self.instance_method(m).source_location]
      }.select{ |m|
        m[1] && m[1][0] =~/activesupport/
      }.map{ |m|
        m[0]
      }.sort
    end
  end
end

unless defined?(::AwesomePrint)
  begin
    require 'awesome_print'
    # Pry.config.print = proc { |output, value|
      # Pry::Helpers::BaseHelpers.stagger_output("=> #{value.ai}", output)
    # }
  rescue LoadError => err
    warn '=> Unable to load awesome_print'
  end
end
