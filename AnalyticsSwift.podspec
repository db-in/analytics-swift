Pod::Spec.new do |s|
    s.name = "Analytics-Swift"
    s.version = "1.8.0"
    s.summary = "The hassle-free way to add Segment analytics to your Swift app (iOS/tvOS/watchOS/macOS/Linux)."
    s.homepage = "https://github.com/segmentio/analytics-swift"
    s.license = "MIT"
    s.authors = "Segment, Inc."
	s.source = { :git => 'https://github.com/db-in/analytics-swift.git', :tag => s.version, :submodules => true }
    s.ios.deployment_target = "15.0"
    s.requires_arc = true
	s.user_target_xcconfig = { 'GENERATE_INFOPLIST_FILE' => 'YES' }
	s.pod_target_xcconfig = { 'GENERATE_INFOPLIST_FILE' => 'YES' }
    s.source_files = 'Sources/**/*.{h,m,swift}'
	#s.resources = 'Sources/**/*{lproj,xcdatamodeld,storyboard,xib,xcassets,json,strings}'
    s.source_files = "Sources/**/*.swift"
    s.dependency 'Sovran'
    s.dependency 'JSONSafeEncoding'
end
