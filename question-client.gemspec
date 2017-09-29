# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name = 'question_component'
  s.version = '0.0.0'
  s.summary = ' '
  s.description = ' '

  s.authors = ['Aaron Dufall']
  s.email = 'aald212@gmail.com'
  s.homepage = 'https://github.com/aarondufall/question-component'
  s.licenses = ['MIT']

  s.require_paths = ['lib']
  s.files = Dir.glob('{lib}/**/*')
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 2.4'

  files = Dir["lib/question/**/*.rb"]

  files += Dir["lib/question_component/{controls.rb,controls/**/*.rb}"]

  files << "lib/question_component/load.rb"

  File.read("lib/question_component/load.rb").each_line.map do |line|
    next if line == "\n"

    _, filename = line.split(/[[:blank:]]+/, 2)

    filename.gsub!(/['"]/, '')
    filename.strip!

    filename = File.join('lib', "#{filename}.rb")

    if File.exist?(filename)
      files << filename
    end
  end

  s.files = files

  s.add_runtime_dependency 'evt-messaging-postgres'
  s.add_runtime_dependency 'evt-configure'

  s.add_development_dependency 'test_bench'
end
