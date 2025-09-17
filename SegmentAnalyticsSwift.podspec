Pod::Spec.new do |s|
    s.name = "SegmentAnalyticsSwift"
    s.version = "1.8.1"
    s.summary = "The hassle-free way to add Segment analytics to your Swift app (iOS/macOS)."
    s.homepage = "https://github.com/segmentio/analytics-swift"
    s.license = "MIT"
    s.authors = "Segment, Inc."
	s.source = { :git => 'https://github.com/db-in/analytics-swift.git', :tag => "analytics-#{s.version}", :submodules => true }
	s.ios.deployment_target = "15.0"
    s.tvos.deployment_target = "15.0"
    s.watchos.deployment_target = "8.0"
    s.macos.deployment_target = "10.15"
    s.swift_versions = ["5.5", "5.7", "5.8", "5.9"]
    s.requires_arc = true
	s.user_target_xcconfig = { 'GENERATE_INFOPLIST_FILE' => 'YES', 'MARKETING_VERSION' => "#{s.version}" }
	s.pod_target_xcconfig = { 'GENERATE_INFOPLIST_FILE' => 'YES', 'MARKETING_VERSION' => "#{s.version}" }
    s.source_files = 'Sources/**/*.{h,m,swift}'
    s.source_files = "Sources/**/*.swift"
    s.resources = "Sources/Segment/Resources/*"
    s.dependency 'SovranSwift'
    s.dependency 'JSONSafeEncodingSwift'
end
