require 'bundler'

Bundler.require(:default, :production)
specs = Bundler.rubygems.all_specs

require 'csv'
CSV.open('gems.csv', 'w') do |cout|
  cout << ['NAME', 'AUTHORS', 'LICENSES', 'HOMEPAGE', 'SUMMARY', 'VERSION']
  specs.each do |spec|
    cout << [spec.name,
             spec.authors.join(" AND "),
             spec.licenses.join(" AND "),
             spec.homepage,
             spec.summary,
             spec.version.to_s]
  end
end
