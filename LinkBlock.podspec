Pod::Spec.new do |s|
  s.name         = "LinkBlock"
  s.version      = "0.0.1"
  s.summary      = "objc的链式编程框架，简化多行无用代码写法"
  s.homepage     = "https://github.com/qddnovo/LinkBlock"
  s.license      = "MIT (example)"
  s.author       = { "Novo" => "quxingyi@outlook.com" }
  s.platform     = :ios, "7.0"
  s.ios.deployment_target = "7.0"
  s.requires_arc = true
  s.source       = { :git => "https://github.com/qddnovo/LinkBlock.git", :commit => "6411b25a6c9d293fbdb4a9d93c8a345b57371d83" }
  s.source_files  = "LinkBlock" , "LinkBlock/*.{h,m}" , "LinkBlock/**/*.{h,m}"
  s.frameworks = 'Foundation', 'CoreGraphics', 'UIKit'
end
