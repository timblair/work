module PlayTime
  class DotFile

    attr_accessor :path

    def self.locate
      @dotfile ||= self.new File.expand_path(File.join('~', '.playtime'))
    end

    def initialize(path)
      @path = path
    end

    def exists?
      File.exists? @path
    end

    def read
      File.readlines(path).collect { |d| d.strip }.sort rescue []
    end

    def write(data)
      File.open(path, 'w+') do |f|
        f.write(data.is_a?(Array) ? data.join("\n") : data)
      end
    end

  end
end
