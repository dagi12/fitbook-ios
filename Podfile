platform :ios, '10.0'

target 'fitbook-ios' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  inhibit_all_warnings!
 
  pod 'Bolts'
  pod 'SwiftLint', '~> 0.25.1'
  pod 'FacebookCore', '~> 0.3.1'
  pod 'FacebookLogin', '~> 0.3.1'
  pod 'FacebookShare', '~> 0.3.1'

  pod 'Fabric'
  pod 'Crashlytics'

  pod 'ErykIosCommon', :path => './ErykIosCommon'

  # Pods for fitbook-ios

  target 'fitbook-iosTests' do
    inherit! :search_paths
    # Pods for testing
    pod 'Quick'
    pod 'Nimble'
    pod 'RxBlocking'
  end

end
