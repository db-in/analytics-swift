Pod::Spec.new do |s|
    s.name = "SegmentAmplitude"
    s.version = "1.4.3"
    s.summary = "Amplitude destination for Segment Analytics Swift"
    s.description = <<-DESC
                     SegmentAmplitude provides Amplitude session tracking and analytics functionality for Segment Analytics Swift applications.
                     DESC
    s.homepage = "https://github.com/db-in/analytics-swift"
    s.license = "MIT"
    s.authors = "Segment, Inc."
    s.source = { :git => 'https://github.com/db-in/analytics-swift.git', :tag => "amplitude-#{s.version}", :submodules => true }
	s.ios.deployment_target = "13.0"
    s.tvos.deployment_target = "11.0"
	s.swift_versions = ["5.5", "5.7", "5.8", "5.9"]
    s.requires_arc = true
    s.user_target_xcconfig = { 'GENERATE_INFOPLIST_FILE' => 'YES' }
    s.pod_target_xcconfig = { 'GENERATE_INFOPLIST_FILE' => 'YES' }
    s.source_files = "SegmentAmplitude/Sources/**/*.swift"
    s.resources = "SegmentAmplitude/Sources/SegmentAmplitude/Resources/*"
    s.dependency 'SegmentAnalyticsSwift'
end
