type Runners::Processor::Cppcheck::config = {
  target: String | Array<String> | nil,
  ignore: String | Array<String> | nil,
  enable: String?,
  std: String?,
  project: String?,
  language: String?,
}

class Runners::Processor::Cppcheck < Runners::Processor
  def cppcheck: -> String
  def config: -> config
  def target: -> Array<String>
  def ignore: -> Array<String>
  def enable: -> Array<String>
  def std: -> Array<String>
  def project: -> Array<String>
  def language: -> Array<String>
  def run_analyzer: -> result
  def parse_result: (Nokogiri::XML::Document) { (Runners::Issues::Structured) -> void } -> void
end

Runners::Processor::Cppcheck::DEFAULT_TARGET: String
Runners::Processor::Cppcheck::DEFAULT_IGNORE: Array<String>

class Runners::Processor::Cppcheck::JSONSchema < StrongJSON
  def runner_config: -> StrongJSON::_Schema<Runners::Processor::Cppcheck::config>
  def rule: -> StrongJSON::_Schema<any>
end
Runners::Processor::Cppcheck::Schema: Runners::Processor::Cppcheck::JSONSchema
