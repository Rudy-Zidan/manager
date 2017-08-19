module Manager
  module GemsHelper
    def gem_environment
      info = {}
      last_key = ''
      first = true
      `gem environment`.each_line do |line|
        if first
          first = false
          next
        end
        clean_line(line)
        info, last_key = build_line_hash(line, info, last_key)
      end
      info
    end

    private
      def clean_line(line)
        line.gsub!('-', '')
        line.delete! "\n"
      end

      def build_line_hash(line, info, last_key)
        if line.include?(':') && !line.include?('https://')
          key, value = line.split(':').map(&:strip)
          if key.present?
            info[key] = [] if value.blank?
            info[key] = value if value.present?
            last_key = key
          else
            info[last_key] << value if value.present?
          end
        else
          info[last_key] << line.lstrip if line.present?
        end
        [info, last_key]
      end
  end
end
