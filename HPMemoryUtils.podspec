Pod::Spec.new do |spec|
  spec.name         = 'HPMemoryUtils'
  spec.version      = '0.0.1'
  spec.license      = { :type => 'MIT' }
  spec.homepage     = 'https://github.com/Pandaliya/HPMemoryUtils'
  spec.authors      = { 'Pan Zhang' => 'yxh.zhang@outlook.com' }
  spec.summary      = 'ARC and GCD Compatible HPMemoryUtils Class for iOS and OS X.'
  spec.source       = { :git => 'https://github.com/Pandaliya/HPMemoryUtils.git', :tag => 'v0.0.1' }
  spec.source_files = 'HPMemoryUtils/*.{h,m}'
  spec.requires_arc = true
  spec.framework    = 'UIKit'
  
  spec.ios.deployment_target = '9.0'
end
