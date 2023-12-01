Pod::Spec.new do |s|
	s.name			= "iosframework"
	s.version		= "1.0.2"
	s.summary		= "iOS mobile SDK test framework."
	s.description 	= <<-DESC
	iOS mobile SDK test framework distribution.

	DESC
	s.homepage		= 'https://cocoapods.org/'
	s.license		= { :type => 'MIT', :file => 'LICENSE' }
	s.author		= { 'Koh Chin Wee' => 'chinweekoh@hotmail.com' }
	s.source		= { :git => 'https://github.com/chinweekoh/iosframework.git', :tag => s.version.to_s }

	s.platform					= :ios, '12.0'
	s.swift_version				= '5.0'
	s.ios.deployment_target 	= '12.0'
	
	s.dependency 'iProov', '~> 10.3.2'
	s.dependency 'lottie-ios', '~> 4.2.0'
	
	s.ios.vendored_frameworks = 'xcframeworks/iOSFramework.xcframework'
end

