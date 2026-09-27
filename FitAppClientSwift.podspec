Pod::Spec.new do |s|
  s.name = 'FitAppClientSwift'
  s.ios.deployment_target = '11.0'
  s.osx.deployment_target = '10.13'
  s.tvos.deployment_target = '11.0'
  s.watchos.deployment_target = '4.0'
  s.version = '0.46.0'
  s.source = { :git => 'git@github.com:OpenAPITools/openapi-generator.git', :tag => 'v0.46.0' }
  s.authors = 'OpenAPI Generator'
  s.license = 'Proprietary'
  s.homepage = 'https://github.com/OpenAPITools/openapi-generator'
  s.summary = 'FitAppClientSwift Swift SDK'
  s.source_files = 'FitAppClientSwift/Classes/**/*.swift'
  s.dependency 'AnyCodable-FlightSchool', '~> 0.6'
  s.dependency 'Alamofire', '~> 5.7'
end
