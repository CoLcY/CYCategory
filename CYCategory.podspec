Pod::Spec.new do |s|
  s.name         = "CYCategory"
  s.version      = "0.0.1"

  s.summary      = "Category of Objective-C."
  s.description  = "This is Category of Objective-C."
  s.homepage     = "https://github.com/CoLcY/CYCategory"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "CoLcY" => "colcie007@hotmail.com" }

  s.requires_arc = true
  s.ios.deployment_target = "7.0"

  s.source       = { :git => "https://github.com/CoLcY/CYCategory.git", :tag => "master" }

  s.source_files  = "CYCategory/CYCategory.h", "CYCategory/CYMacro.h"
  s.public_header_files = "CYCategory/CYCategory.h", "CYCategory/CYMacro.h"

  s.subspec 'Foundation' do |ss|
    ss.source_files  = "CYCategory/Foundation/**/*.{h,m}"
    ss.public_header_files = "CYCategory/Foundation/Foundation+CoLcY.h"
    ss.ios.frameworks = "Foundation"
  end

  s.subspec 'UIKit' do |ss|
    ss.source_files  = "CYCategory/UIKit/**/*.{h,m}"
    ss.public_header_files = "CYCategory/UIKit/UIKit+CoLcY.h"
    ss.ios.frameworks = "UIKit"
    ss.dependency 'CYCategory/Foundation'
  end
  

end
