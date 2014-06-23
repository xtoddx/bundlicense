require 'pry-debugger'
require 'bundler'

Bundler.require(:default, :production)
specs = Bundler.rubygems.all_specs

require 'fileutils'
FileUtils.mkdir_p('gem-sources')

specs.each do |spec|
  if spec.default_gem? and !File.directory?(spec.full_gem_path)
    name = File.basename(spec.full_gem_path)
    FileUtils.mkdir_p "gem-sources/#{name}"
    File.open("gem-sources/#{name}/README", 'w') do |file|
      file.write "This is a defualt gem distrubuted by ruby. " +
                 "As such, it does not have a self-contined source directory."
    end
  else
    FileUtils.cp_r spec.full_gem_path, 'gem-sources'
  end
end
