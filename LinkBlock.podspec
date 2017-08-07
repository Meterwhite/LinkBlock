Pod::Spec.new do |s|
  s.name         = "LinkBlock"
  s.version      = "2.1.9"
  s.summary      = 'objc chain programming.'
  s.homepage     = 'https://github.com/qddnovo/LinkBlock'
  s.license      = 'MIT'
  s.author       = { "Novo" => "quxingyi@outlook.com" }
  s.platform     = :ios, '7.0'
  s.ios.deployment_target = '7.0'
  s.requires_arc = true
  s.source       = { :git => "https://github.com/qddnovo/LinkBlock.git", :tag => s.version}
  s.source_files  = 'LinkBlock/**/*.{h,m}'
end
