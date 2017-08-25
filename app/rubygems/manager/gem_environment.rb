class Manager::GemEnvironment

  # Load the command based on the class name
  def initialize
    cmd_name = self.class.name.demodulize.underscore.to_sym
    @cmd = Rails.configuration.rubygems_commands[cmd_name]
  end

  # Execute 'gem environment' command and parse its result.
  def execute
    hash = {}
    first = true
    last_key = ''
    `#{@cmd}`.each_line do |line|
      if first
        first = false
        next
      end
      last_key = build_gem_environment_line_hash(line, hash, last_key)
    end
    hash
  end

  private
    # Remove both '-' and '\n' from each line
    def clean_gem_environment_line(line)
      line.gsub!('-', '')
      line.delete! "\n"
    end

    # Build hash of information gained from 'gem environment'
    # and keep track of last_key which represent ex: 'RUBY VERSION' as key
    def build_gem_environment_line_hash(line, hash, last_key)
      clean_gem_environment_line(line)
      if line.include?(':') && !line.include?('https://')
        last_key = extract_gem_enviroment_line(line, hash, last_key)
      else
        hash[last_key] << line.lstrip if line.present?
      end
      last_key
    end

    # Group values based on specific key
    def extract_gem_enviroment_line(line, hash, last_key)
      key, value = line.split(':').map(&:strip)
      if key.present?
        hash[key] = [] if value.blank?
        hash[key] = value if value.present?
        last_key = key
      else
        hash[last_key] << value if value.present?
      end
      last_key
    end
end
