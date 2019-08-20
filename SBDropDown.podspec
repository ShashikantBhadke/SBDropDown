Pod::Spec.new do |spec|

  spec.name         = "SBDropDown"
  spec.version      = "0.0.7"
  spec.summary      = "Simple DropDown for Any type of array.... with date picker also added"
  spec.homepage     = "https://github.com/ShashikantBhadke/SBDropDown"
  spec.screenshots  = "https://raw.githubusercontent.com/ShashikantBhadke/SBDropDown/master/1.png,https://raw.githubusercontent.com/ShashikantBhadke/SBDropDown/master/4.png"
  spec.license      = "MIT"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Shashikant_B" => "shashibhadke22@gmail.com" }
  spec.platform     = :ios, "10.0"
  spec.source       = {
            :git => "https://github.com/ShashikantBhadke/SBDropDown.git",
            :tag => "0.0.7"
  }
  spec.source_files  = "SBDropDown/**/*.swift"
  spec.resources     = "SBDropDown/**/*.xib"
  spec.swift_versions = "5.0"
  spec.ios.deployment_target = "10.0"
end
