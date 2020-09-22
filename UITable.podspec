Pod::Spec.new do |s|
  s.name             = 'UITable'
  s.version          = '0.1.0'
  s.summary          = 'A tiny dynamic table creator in swift'
  s.description      = ""
  s.homepage         = 'https://github.com/yasinkbas/UITable'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'yasinkbas' => 'yasin.kbas12@gmail.com' }
  s.source           = { :git => 'https://github.com/yasinkbas/UITable.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'
  s.swift_version = '5.0'

  s.source_files = 'UITable/Classes/**/*'
  
end
