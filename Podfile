# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'

def rx_swift
    pod 'RxSwift',    '~> 3.0'
    pod 'RxCocoa',    '~> 3.0'
end

def firebase
    pod 'Firebase/Core'
    pod 'Firebase/Auth'
    
    pod 'FirebaseUI/Auth', '~> 4.0'
    pod 'FirebaseUI/Facebook', '~> 4.0'
    pod 'FirebaseUI/Google', '~> 4.0'
end

target 'Helphy' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  
  # Pods for Helphy
  pod 'CircleMenu', '~> 2.0.1'
  pod 'FaceAware'
  pod 'Hue'
  pod 'Presentation'
  pod 'Spring', :git => 'https://github.com/MengTo/Spring.git', :branch => 'swift3'
  pod 'ChameleonFramework/Swift'
  pod 'FontAwesomeKit'
  rx_swift
  firebase
  
  target 'HelphyTests' do
    inherit! :search_paths
    # Pods for testing
    rx_swift
  end

  target 'HelphyUITests' do
    inherit! :search_paths
    # Pods for testing
    rx_swift
    firebase
  end

end
