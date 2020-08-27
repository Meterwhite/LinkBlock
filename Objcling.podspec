Pod::Spec.new do |s|
  s.name         = "Objcling"
  s.version      = "1.0.0"
  s.summary      = 'objc chain programming.'
  s.homepage     = 'https://github.com/Meterwhite/LinkBlock'
  s.license      = 'MIT'
  s.author       = { "Novo" => "meterwhite@outlook.com" }
  s.platform     = :ios, '8.0'
  s.ios.deployment_target = '8.0'
  s.requires_arc = true
  s.source       = { :git => "https://github.com/Meterwhite/LinkBlock.git", :tag => s.version}
  s.source_files  = 'Objcling/**/*.{h,m}'
end