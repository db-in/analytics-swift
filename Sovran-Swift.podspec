Pod::Spec.new do |s|
    s.name = "Sovran-Swift"
    s.version = "1.1.2"
    s.summary = "A Swift state management library"
    s.description = <<-DESC
                     Sovran is a Swift state management library that provides a simple and efficient way to manage state in your Swift applications.
                     DESC
    s.homepage = "https://github.com/db-in/analytics-swift"
    s.license = "MIT"
    s.authors = "Segment, Inc."
    s.source = { :git => 'https://github.com/db-in/analytics-swift.git', :tag => "sovran-#{s.version}", :submodules => true }
	s.ios.deployment_target = "15.0"
    s.tvos.deployment_target = "15.0"
    s.watchos.deployment_target = "8.0"
    s.macos.deployment_target = "10.0"
	s.swift_versions = ["5.5", "5.7", "5.8", "5.9"]
    s.requires_arc = true
    s.user_target_xcconfig = { 'GENERATE_INFOPLIST_FILE' => 'YES' }
    s.pod_target_xcconfig = { 'GENERATE_INFOPLIST_FILE' => 'YES' }
    s.source_files = "Sovran-Swift/Sources/**/*.swift"
end
