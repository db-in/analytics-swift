Pod::Spec.new do |s|
    s.name = "JSONSafeEncoding"
    s.version = "2.0.0"
    s.summary = "A Swift JSON encoding library that handles edge cases safely"
    s.description = <<-DESC
                     JSONSafeEncoding provides safe JSON encoding for Swift applications, handling edge cases that the standard JSONEncoder might not handle gracefully.
                     DESC
    s.homepage = "https://github.com/db-in/analytics-swift"
    s.license = "MIT"
    s.authors = "Segment, Inc."
    s.source = { :git => 'https://github.com/db-in/analytics-swift.git', :tag => "jsonsafeencoding-#{s.version}", :submodules => true }
    s.ios.deployment_target = "13.0"
    s.tvos.deployment_target = "13.0"
    s.watchos.deployment_target = "7.1"
    s.macos.deployment_target = "10.15"
    s.requires_arc = true
    s.user_target_xcconfig = { 'GENERATE_INFOPLIST_FILE' => 'YES' }
    s.pod_target_xcconfig = { 'GENERATE_INFOPLIST_FILE' => 'YES' }
    s.source_files = "JSONSafeEncoding-Swift/Sources/**/*.swift"
end
