platform :ios, '11.0'

def shared_pods
  # Networking
  pod 'Alamofire', '~> 4.9.1' # https://github.com/Alamofire/Alamofire
  pod 'ObjectMapper', '~> 3.5.1' # https://github.com/tristanhimmelman/ObjectMapper

  # Image
  pod 'AlamofireImage', '~> 3.5.2' # https://github.com/Alamofire/AlamofireImage

  # Analytics
  pod 'Umbrella' # https://github.com/devxoul/Umbrella
  pod 'Firebase/Analytics', '~> 6.16.0'
  pod 'Bugsnag', '~> 5.23.0' # https://github.com/bugsnag/bugsnag-cocoa
  pod 'FacebookCore', '~> 0.9.0'
  pod 'FacebookShare', '~> 0.9.0'

  #SSO
  pod 'GoogleSignIn'

  # Sockets
  pod 'Socket.IO-Client-Swift', '~> 15.2.0' # https://github.com/socketio/socket.io-client-swift

  # Dependency injection
  pod 'Swinject', '~> 2.7.1' # https://github.com/Swinject/Swinject
  pod 'SwinjectAutoregistration', '2.7.0'

  # Code quality
  pod 'SwifterSwift/Foundation' # https://github.com/SwifterSwift/SwifterSwift
  pod 'SwifterSwift/UIKit'

  # Ui
  pod 'ImageSlideshow', '~> 1.8.1' # https://github.com/zvonicek/ImageSlideshow
  pod 'WhatsNewKit' , '~> 1.3.1' # https://github.com/SvenTiigi/WhatsNewKit
  pod 'MessageKit', '~> 3.0.0' # https://github.com/MessageKit/MessageKit
  pod 'Localize-Swift', '~> 3.1.0' # https://github.com/marmelroy/Localize-Swift
  pod 'Hero', '~> 1.5.0'  # https://github.com/lkzhao/Hero
  pod 'NVActivityIndicatorView', '~> 4.8.0' # https://github.com/ninjaprox/NVActivityIndicatorView
  pod 'Toast-Swift', '~> 5.0.0' # https://github.com/scalessec/Toast-Swift

  # Date
  pod 'SwiftDate', '~> 6.1.0' # https://github.com/malcommac/SwiftDate

  # Rx Extensions
  pod 'RxAlamofire', '~> 5.1.0' # https://github.com/RxSwiftCommunity/RxAlamofire
  pod "RxGesture", '~> 3.0' # https://github.com/RxSwiftCommunity/RxGesture
  pod 'RxSwift', '~> 5.0.1' # https://github.com/ReactiveX/RxSwift
  pod 'RxTheme', '~> 4.0' # https://github.com/RxSwiftCommunity/RxTheme
  pod 'RxDataSources', '~> 4.0' # https://github.com/RxSwiftCommunity/RxDataSources
  pod 'NSObject+Rx', '~> 5.0' # https://github.com/RxSwiftCommunity/NSObject-Rx

  # Tools
  pod 'KeychainAccess', '~> 4.1.0' # https://github.com/kishikawakatsumi/KeychainAccess

  # Tools
  pod 'R.swift' # https://github.com/mac-cain13/R.swift
  pod 'SwiftLint' # https://github.com/realm/SwiftLint

end

target 'Luminoso' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods
  shared_pods

  target 'LuminosoTests' do
    inherit! :search_paths
    # Pods for testing
    pod 'RxBlocking', '~> 5.0.1'
    pod 'RxTest', '~> 5.0.1'
    pod 'Quick'
    pod 'Nimble'
  end

  target 'LuminosoUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end
