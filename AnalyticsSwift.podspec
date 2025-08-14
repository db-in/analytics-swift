Pod::Spec.new do |s|
    s.name = "Analytics-Swift"
    s.version = "1.8.0"
    s.license = "MIT"
    s.summary = "The hassle-free way to add Segment analytics to your Swift app (iOS/tvOS/watchOS/macOS/Linux)."
    s.homepage = "https://github.com/segmentio/analytics-swift"
    s.authors = "Segment, Inc."

    s.ios.deployment_target = "15.0"
    s.requires_arc = true

    s.source = { :path => "./Sources" }
    s.source_files = "Sources/**/*.swift"

    s.dependency 'Sovran'
end
