require 'json'
require 'pathname'
require 'json'

class LanguageVersions
  class << self
    def fetch(targets=[])
      (Dir.glob((Pathname(File.expand_path(File.dirname(__FILE__))) + 'config'+'*json').to_s)).inject({}) do |conf, filename|
        conf.merge(JSON.parse(File.read(filename)))
      end.select do |key, conf|
        targets.empty? || targets.include?(key)
      end.inject([]) do |result, (key, conf)|
        result.push(key => parse(execute(conf['version']), conf['parser']))
      end
    end
    
    private

      def execute(cmd)
        `#{cmd} 2>&1`
      end
      
      def parse(str, parser)
        str.match(Regexp.new(parser))
        $1 || ''
      end
  end
end
