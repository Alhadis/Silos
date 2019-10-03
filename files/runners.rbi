type issue = Runners::Issues::Identified | Runners::Issues::Text | Runners::Issues::Structured

class Runners::Issues::InvalidIssueError
  attr_reader issue: issue
  def initialize: (issue: issue) -> issue
end

class Runners::Issues::Base
  attr_reader path: Pathname
  attr_reader location: Location?
  attr_reader id: String

  def ensure_validity: () -> self
                     | <'a> { (self) -> 'a } -> 'a
  def eql?: (any) -> any
  def hash: () -> any
  def valid?: () -> bool
  def as_json: () -> any
end

class Runners::Issues::Identified < Runners::Issues::Base
  def initialize: (path: Pathname, location: Location?, id: String) -> any
end

class Runners::Issues::Structured < Runners::Issues::Base
  attr_reader object: any

  def initialize: (path: Pathname, location: Location?, id: String, object: any, schema: any) -> any
  def test_schema: (any, any) -> bool
end

class Runners::Issues::Structured::InvalidObject
  attr_reader object: any
  def initialize: (object: any) -> any
end

class Runners::Issues::Text < Runners::Issues::Base
  attr_reader message: String
  attr_reader links: Array<String>
  def initialize: (path: Pathname, location: Location?, id: String, message: String, links: Array<String>) -> any
end

interface Runners::_Writer
  def <<: (Schema::Types::any_trace) -> void
end

class Runners::TraceWriter
  attr_reader writer: _Writer
  def initialize: (writer: _Writer) -> any

  def command_line: (Array<String>, ?recorded_at: Time) -> void
  def status: (any, ?recorded_at: Time) -> void
  def stdout: (String, ?recorded_at: Time, ?max_length: Integer) -> void
  def stderr: (String, ?recorded_at: Time, ?max_length: Integer) -> void
  def message: (String, ?recorded_at: Time, ?max_length: Integer) -> void
             | <'x> (String, ?recorded_at: Time, ?max_length: Integer) { -> 'x } -> 'x
  def header: (String, ?recorded_at: Time) -> void
  def warning: (String, ?file: any, ?recorded_at: Time) -> void
  def ci_config: (Hash<any, any>, ?recorded_at: Time) -> void
  def error: (String, ?recorded_at: Time, ?max_length: Integer) -> void
  def <<: (any) -> void
  def each_slice: (String, size: Integer) { (String) -> void } -> void
end

class Runners::Analyzer
  attr_reader name: String
  attr_reader version: String
  def initialize: (name: String, version: String) -> any
  def valid?: () -> bool
  def as_json: () -> Hash<any, any>
end

type result = Runners::Results::Success
            | Runners::Results::Failure
            | Runners::Results::MissingFilesFailure
            | Runners::Results::Error

class Runners::Results::Base
  attr_reader guid: String
  attr_reader timestamp: Time

  def initialize: (guid: String) -> any
  def as_json: () -> Hash<any, any>
  def valid?: () -> bool
end

class Runners::Results::Success < Runners::Results::Base
  attr_reader issues: Array<issue>
  attr_reader analyzer: Analyzer

  def initialize: (guid: String, analyzer: Analyzer) -> any
  def add_issue: (issue) -> void
  def (constructor) filter_issue: { (issue) -> bool } -> instance
end

class Runners::Results::Success::InvalidIssue
  attr_reader issue: issue
  def initialize: (issue: issue) -> any
end

class Runners::Results::Failure < Runners::Results::Base
  attr_reader message: String
  attr_reader analyzer: Analyzer?
  def initialize: (guid: String, message: String, ?analyzer: Analyzer?) -> any
end

class Runners::Results::MissingFilesFailure < Runners::Results::Base
  attr_reader files: Array<Pathname>
  def initialize: (guid: String, files: Array<Pathname>) -> any
end

class Runners::Results::Error < Runners::Results::Base
  attr_reader exception: any
  def initialize: (guid: String, exception: any) -> any
end

class Runners::Changes
  attr_reader changed_files: Array<ChangedFile>
  attr_reader unchanged_paths: Array<Pathname>
  attr_reader untracked_paths: Array<Pathname>

  def initialize: (changed_files: Array<ChangedFile>,
                   unchanged_paths: Array<Pathname>,
                   untracked_paths: Array<Pathname>) -> any
  def delete_unchanged: (dir: Pathname, ?except: Array<String>, ?only: Array<String>) { (Pathname) -> void }-> void
  def self.calculate: (base_dir: Pathname, head_dir: Pathname, working_dir: Pathname) -> instance
end

class Runners::Changes::ChangedFile
  attr_reader path: Pathname
  def initialize: (path: Pathname) -> any
end

type prepare_type = :base | :head

class Runners::Workspace
  attr_reader working_dir: Pathname
  attr_reader base_dir: Pathname
  attr_reader head_dir: Pathname
  attr_reader git_ssh_path: String?

  def initialize: (working_dir: Pathname, head_dir: Pathname, base_dir: Pathname, git_ssh_path: String?) -> any

  def calculate_changes: () -> Changes
  def self.open: <'a> (base: String?, base_key: String?, head: String, head_key: String?, ssh_key: String?, working_dir: Pathname, trace_writer: TraceWriter) { (instance) -> 'a } -> 'a
  def self.prepare_ssh: <'a> (String?, trace_writer: TraceWriter) { (String?) -> 'a } -> 'a
  def self.prepare_in_dir: (prepare_type, String, String?, Pathname, trace_writer: TraceWriter) -> void
  def self.decrypt: <'a> (Pathname, String?, trace_writer: TraceWriter) { (Pathname) -> 'a } -> 'a
  def self.decrypt_by_openssl: (Pathname, String, Pathname) -> void
  def self.extract: (Pathname, Pathname, trace_writer: TraceWriter) -> void
  def self.download: <'a> (URI) { (any) -> 'a } -> 'a
  def self.ssh_key_content: () -> String
end

class Runners::Workspace::DownloadError
end

class Runners::Processor
  attr_reader guid: String
  attr_reader working_dir: Pathname
  attr_reader git_ssh_path: String
  attr_reader trace_writer: TraceWriter
  attr_reader shell: Shell
  attr_reader warnings: Array<any>
  attr_reader ci_config: any
  attr_reader ci_config_for_collect: any

  def initialize: (guid: any, working_dir: any, git_ssh_path: any, trace_writer: TraceWriter) -> any
  def relative_path: (String, ?from: Pathname) -> Pathname
  def setup: () { -> result } -> result
  def analyze: (Changes) -> result
  def ci_config_path: () -> Pathname
  def ci_config_path_name: () -> String
  def ci_section: (?Hash<any, any>) -> Hash<any, any>
  def ci_section_root_dir: () -> String?
  def check_root_dir_exist: () -> result?
  def push_root_dir: <'x> { -> 'x } -> 'x
  def ensure_files: (*Pathname) { (Pathname) -> result } -> result
  def ensure_runner_config_schema: <'x> (any) { ('x) -> result } -> result
  def push_dir: <'x> (Pathname) { -> 'x } -> 'x
  def current_dir: () -> Pathname

  def capture3: (String, *String) -> [String, String, Process::Status]
  def capture3!: (String, *String) -> [String, String]
  def capture3_with_retry!: (String, *String, ?tries: Integer) -> [String, String]

  def capture3_trace: (String, *String) -> [String, String, Process::Status]

  def push_env_hash: <'x> (Hash<String, String?>) { -> 'x } -> 'x
  def env_hash: -> Hash<String, String?>

  def delete_unchanged_files: (Changes, ?except: Array<String>, ?only: Array<String>) -> void
  def add_warning: (String, ?file: String?) -> void
  def add_warning_if_deprecated_version: (minimum: String, ?file: String?) -> void
  def self.ci_config_section_name: () -> String
  def analyzer: -> Analyzer
  def analyzer_name: -> String
  def analyzer_bin: -> String
  def analyzer_version: -> String
  def extract_version!: (String | Array<String>, ?(String | Array<String>), ?pattern: Regexp) -> String
  def build_field_reference_from_path: (StrongJSON::Type::ErrorPath) -> String
  def root_dir: -> Pathname
  def directory_traversal_attack?: (String) -> bool
end

class Runners::Shell
  attr_reader trace_writer: TraceWriter
  attr_reader env_hash_stack: Array<Hash<String, String?>>
  attr_reader dir_stack: Array<Pathname>

  def initialize: (current_dir: Pathname, env_hash: Hash<String, String?>, trace_writer: TraceWriter) -> any

  def capture3: (String, *String) -> [String, String, Process::Status]
  def capture3!: (String, *String) -> [String, String]
  def capture3_with_retry!: (String, *String, ?tries: Integer) -> [String, String]
  def capture3_trace: (String, *String) -> [String, String, Process::Status]

  def push_dir: <'x> (Pathname) { -> 'x } -> 'x
  def current_dir: () -> Pathname

  def push_env_hash: <'x> (Hash<String, String?>) { -> 'x } -> 'x
  def env_hash: -> Hash<String, String?>
end

class Runners::Shell::ExecError
  attr_reader type: Symbol
  attr_reader args: Array<String>
  attr_reader stdout_str: String
  attr_reader stderr_str: String
  attr_reader status: Process::Status
  attr_reader dir: Pathname

  def initialize: (type: Symbol, args: Array<String>, stdout_str: String, stderr_str: String, status: Process::Status, dir: Pathname) -> any
end

class Runners::Harness
  attr_reader guid: String
  attr_reader processor_class: Processor.class constructor
  attr_reader workspace: Workspace
  attr_reader trace_writer: TraceWriter
  attr_reader warnings: Array<String>
  attr_reader ci_config: any

  def initialize: (guid: String, processor_class: Processor.class constructor, workspace: Workspace, trace_writer: TraceWriter) -> any
  def run: () -> result
  def ensure_result: { -> result } -> result
end

class Runners::Harness::InvalidResult
  attr_reader result: result
  def initialize: (result: result) -> any
end

class Runners::CLI
  attr_reader stdout: IO
  attr_reader stderr: IO
  attr_reader entrypoint: Pathname
  attr_reader base: String?
  attr_reader base_key: String?
  attr_reader head: String
  attr_reader head_key: String?
  attr_reader ssh_key: String
  attr_reader working_dir: String?
  attr_reader guid: String
  attr_reader analyzer: String
  attr_reader outputs: Array<String>

  def initialize: (argv: Array<String>, stdout: IO, stderr: IO) -> any

  def with_working_dir: <'x> { (Pathname) -> 'x } -> 'x
  def processor_class: () -> Processor.class
  def validate_options!: () -> self
  def validate_analyzer!: () -> void
  def run: () -> void
  def io: () -> any
end

module Runners
end

type Runners::gems_item = {
  "name" => String,
  "version" => String?,
  "source" => String?,
  "git" => git_source?,
}

type Runners::git_source = {
  "repo" => String,
  "ref" => String?,
  "branch" => String?,
  "tag" => String?,
}

module Runners::Ruby : Processor
  # Install given gems and setup environment variables, and yield the block
  def install_gems: <'x> (Array<GemInstaller::Spec>, ?optionals: Array<GemInstaller::Spec>, constraints: Hash<String, Array<String>>) { (Hash<String, String>) -> 'x } -> 'x
  def default_specs: (Array<GemInstaller::Spec>, Hash<String, Array<String>>, LockfileLoader::Lockfile) -> Array<GemInstaller::Spec>
  def optional_specs: (Array<GemInstaller::Spec>, LockfileLoader::Lockfile) -> Array<GemInstaller::Spec>
  def user_specs: (Array<GemInstaller::Spec>, LockfileLoader::Lockfile) -> Array<GemInstaller::Spec>
  def show_ruby_runtime_versions: -> void
  def ruby_analyzer_bin: -> Array<String>
end

Runners::Ruby::GemInstaller::DEFAULT_SOURCE: String

class Runners::Ruby::GemInstaller
  attr_reader trace_writer: TraceWriter
  attr_reader env_hash: Hash<String, String?>
  attr_reader gem_home: Pathname
  attr_reader specs: Array<Spec>
  attr_reader shell: Shell
  attr_reader constraints: Hash<String, Array<String>>

  def initialize: (shell: Shell,
                   home: Pathname,
                   ci_config_path_name: String,
                   specs: Array<Spec>,
                   constraints: Hash<String, Array<String>>,
                   trace_writer: TraceWriter) -> void
  def install!: <'x> { (Hash<String, String>) -> 'x } -> 'x

  def gemfile_path: -> Pathname
  def gemfile_content: () -> Array<String>
end

class Runners::Ruby::GemInstaller::Spec
  attr_reader name: String
  attr_reader version: Array<String>
  attr_reader source: RubygemsSource | GitSource

  def initialize: (name: String, version: Array<String>, ?source: RubygemsSource | GitSource) -> any
  def override_by_lockfile: (LockfileLoader::Lockfile) -> self

  def self.from_gems: (Array<gems_item | String>) -> Array<Spec>
  def self.merge: (Array<Spec>, Array<Spec>) -> Array<Spec>
end

class Runners::Ruby::GemInstaller::RubygemsSource
  attr_reader source: String

  def initialize: (String) -> any
  def ==: (any) -> bool
  def to_s: () -> String
end

class Runners::Ruby::GemInstaller::GitSource
  attr_reader repo: String
  attr_reader ref: String?
  attr_reader branch: String?
  attr_reader tag: String?

  def initialize: (repo: String, ?ref: String?, ?branch: String?, ?tag: String?) -> any
  def ==: (any) -> bool
  def to_s: () -> String
end

class Runners::Ruby::LockfileLoader
  attr_reader root_dir: Pathname
  attr_reader shell: Shell

  def initialize: (root_dir: Pathname, shell: Shell) -> any

  def gemfile_path: -> Pathname
  def ensure_lockfile: <'x> () { (Lockfile) -> 'x } -> 'x
end

class Runners::Ruby::LockfileLoader::Lockfile
  attr_reader specs: Array<any>

  def initialize: (Pathname?) -> any

  def spec_exists?: (String) -> bool
  def locked_version: (String) -> String?
  def satisfied_by?: (String, Hash<String, Array<String>>) -> bool
end

class Runners::Ruby::LockfileLoader::Lockfile::UnsupportedSourceError < StandardError
  attr_reader name: String
  attr_reader source: any

  def initialize: (name: String, source: any) -> any
end

module Runners::Ruby::LockfileParser
  def self.parse: (String) -> Bundler::LockfileParser
end

type npm_install_option = bool | String

module Runners::Nodejs : Processor
  def nodejs_analyzer_local_command: -> String
  def nodejs_analyzer_bin: -> String
  def package_json_path: -> Pathname
  def package_json: -> Hash<Symbol, any>
  def package_lock_json_path: -> Pathname
  def yarn_lock_path: -> Pathname
  def install_nodejs_deps: (DefaultDependencies, constraints: Hash<String, Constraint>,
                            install_option: npm_install_option | nil) -> void

  # private
  def nodejs_analyzer_locally_installed?: -> bool
  def nodejs_analyzer_global_version: -> String
  def nodejs_analyzer_local_version: -> String
  def show_runtime_versions: -> void
  def check_nodejs_default_deps: (DefaultDependencies, Hash<String, Constraint>) -> void
  def check_duplicate_lockfiles: -> void
  def npm_install: (npm_install_option) -> void
  def yarn_install: (npm_install_option) -> void
  def check_installed_nodejs_deps: (Hash<String, Constraint>, Dependency) -> void
end
Runners::Nodejs::REQUIRED_NODE_VERSIONS: Array<String>
Runners::Nodejs::REQUIRED_NPM_VERSIONS: Array<String>
Runners::Nodejs::REQUIRED_YARN_VERSIONS: Array<String>
Runners::Nodejs::INSTALL_OPTION_NONE: bool
Runners::Nodejs::INSTALL_OPTION_ALL: bool
Runners::Nodejs::INSTALL_OPTION_PRODUCTION: String
Runners::Nodejs::INSTALL_OPTION_DEVELOPMENT: String

class Runners::Nodejs::Dependency
  attr_reader name: String
  attr_reader version: String
  def initialize: (name: String, version: String) -> any
end

class Runners::Nodejs::DefaultDependencies
  attr_reader main: Dependency
  attr_reader extras: Array<Dependency>
  def initialize: (main: Dependency, ?extras: Array<Dependency>) -> any
  def all: -> Array<Dependency>
end

class Runners::Nodejs::Constraint
  def initialize: (String, *String) -> any
  def satisfied_by?: (Dependency) -> bool
  def unsatisfied_by?: (Dependency) -> bool
end
