require 'yaml'

module Work
  class DotFile

    attr_accessor :path, :ip, :domains
    attr_writer :ip, :domains

    def self.locate
      @dotfile ||= self.new File.expand_path(File.join('~', '.work'))
    end

    def initialize(path)
      @path = path
      read!
    end

    def ip
      @ip ||= Work::DEFAULT_IP
    end

    def domains
      @domains ||= Work::DEFAULT_DOMAINS
    end

    def exists?
      File.exists? @path
    end

    def read!
      if exists?
        data = YAML.load_file(path)
        self.ip = data["ip"] if data.has_key?("ip")
        self.domains = data["domains"].sort if data.has_key?("domains")
      end
    end

    def write!
      File.open(path, 'w+') do |f|
        f.write YAML::dump({ "ip" => ip, "domains" => domains })
      end
    end

  end
end
