Pod::Spec.new do |s|
  s.name         = "LinkBlock"
  s.version      = "0.0.1"
  s.summary      = "objc的链式编程框架，简化多行无用代码写法"
  s.homepage     = "https://github.com/qddnovo/LinkBlock"
  s.license      = "MIT"
  s.author       = { "Novo" => "quxingyi@outlook.com" }
  s.platform     = :ios, "7.0"
  s.ios.deployment_target = "7.0"
  s.requires_arc = true
  s.source       = { :git => "https://github.com/qddnovo/LinkBlock.git", :tag => s.version, :commit => "4ce438d8d57a59ee12b95eb5b2a00a9c24ee473d"}
  s.source_files  =  "LinkBlock" "LinkBlock/**/*"
  #s.frameworks = 'Foundation', 'CoreGraphics', 'UIKit'
end
