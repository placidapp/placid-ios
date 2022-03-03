Pod::Spec.new do |spec|
  spec.name = 'Placid'
  spec.version = '0.1.1'
  spec.summary = 'Placid iOS SDK'
  spec.homepage = 'https://placid.app'
  spec.author = { 'Placid' => 'support@placid.app' }
  spec.source = { :http => "https://github.com/placidapp/placid-ios/releases/download/0.1.1/Placid.xcframework.zip" }
  spec.license = { :type => "BSD-3-Clause" }

  spec.ios.deployment_target = '13.0'
  spec.vendored_frameworks = "Placid.xcframework"
end