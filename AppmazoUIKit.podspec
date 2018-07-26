#
# Be sure to run `pod lib lint AppmazoUIKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'AppmazoUIKit'
    s.version          = '1.0.5'
    s.summary          = 'Collection of UI Elements and tools.'
    s.swift_version    = '4.1'
    
    # This description is used to generate tags and improve search results.
    #   * Think: What does it do? Why did you write it? What is the focus?
    #   * Try to keep it short, snappy and to the point.
    #   * Write the description between the DESC delimiters below.
    #   * Finally, don't worry about the indent, CocoaPods strips it!
    
    s.description      = <<-DESC
    AppmazoUIKit is a collection of useful and simple UI Elements and tools to make your app breezy.
    DESC
    
    s.homepage         = 'https://github.com/Appmazo/AppmazoUIKit'
    # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Appmazo LLC' => 'jhickman@appmazo.com' }
    s.source           = { :git => 'https://github.com/Appmazo/AppmazoUIKit.git', :tag => s.version.to_s }
    s.social_media_url = 'https://twitter.com/appmazo'
    
    s.ios.deployment_target = '11.0'
    
    s.source_files = 'AppmazoUIKit/Classes/**/*.*'
    s.resources = 'AppmazoUIKit/Assets/**/*.*'

    # s.public_header_files = 'Pod/Classes/**/*.h'
    # s.frameworks = 'UIKit', 'MapKit'
    s.dependency 'AppmazoFoundation', '~> 1.0.1'
end
