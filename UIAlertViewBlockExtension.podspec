Pod::Spec.new do |spec|
  spec.name         = 'UIAlertViewBlockExtension'
  spec.version      = '1.1.0'
  spec.license      = 'MIT'
  spec.summary      = 'UIAlertView category for block expression'
  spec.homepage     = 'https://github.com/mangofever/UIAlertViewWithBlock'
  spec.author       = 'Mangofever'
  spec.source       = { :git => 'https://github.com/mangofever/UIAlertViewWithBlock.git', :tag => '1.1.0' }
  spec.source_files = 'AlertViewExamples/UIAlertViewBlockExtension/*'
  spec.requires_arc = true
  spec.ios.deployment_target = '4.0'
  spec.platform         = :ios, '7.0'
end
