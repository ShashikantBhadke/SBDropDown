Pod::Spec.new do |spec|

  spec.name         = "SBDropDown"
  spec.version      = "0.0.3"
  spec.summary      = "Simple DropDown for Any type of array...."
  spec.homepage     = "https://github.com/ShashikantBhadke/SBDropDown"
  spec.screenshots  = "https://raw.githubusercontent.com/ShashikantBhadke/SBDropDown/master/Screenshot%202019-07-31%20at%209.38.03%20PM.png"
  spec.license      = "MIT"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Shashikant_B" => "shashibhadke22@gmail.com" }
  spec.platform     = :ios, "10.0"
  spec.source       = {
            :git => "https://github.com/ShashikantBhadke/SBDropDown.git",
            :tag => "0.0.3"
  }
  spec.source_files  = "SBDropDown/**/*.swift"
  spec.resources     = "SBDropDown/**/*.xib"
  spec.swift_version = "5"
  spec.ios.deployment_target = "10.0"
end
