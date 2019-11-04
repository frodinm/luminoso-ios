platform :ios, '9.0'

def shared_pods
  pod 'RxAlamofire', '~> 5.1.0'
  pod 'Alamofire', '~> 4.9.0'
  pod 'AlamofireImage', '~> 3.5.2'
  pod 'Firebase/Analytics', '~> 6.11.0'
  pod 'Bugsnag', '~> 5.22.9'
  pod 'FacebookCore', '~> 0.9.0'
  pod 'FacebookShare', '~> 0.9.0'
  pod 'Socket.IO-Client-Swift', '~> 15.2.0'
  pod 'SwiftKeychainWrapper', '~> 3.4.0'
  pod 'SwiftyRSA', '~> 1.5.0'
  pod 'RxSwift', '~> 5.0.1'
  pod 'RxCocoa', '~> 5.0.1'
  pod 'Swinject', '~> 2.7.1'
  pod 'ObjectMapper', '~> 3.5.1'
end

target 'Luminoso' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Zuccini
  shared_pods

  target 'LuminosoTests' do
    inherit! :search_paths
    # Pods for testing
    pod 'RxBlocking'
    pod 'RxTest'
  end

  target 'LuminosoUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end
