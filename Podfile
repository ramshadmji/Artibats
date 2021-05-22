# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def shared_pods
   pod 'Firebase/Core'
   pod 'Firebase/Auth'
   pod 'Firebase/Firestore'
   pod 'Firebase/Storage'
   pod 'IQKeyboardManagerSwift' 
   pod 'Kingfisher', '~> 4.0'
   pod 'CodableFirebase'
   
end


target 'E-Com' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for E-Com
  shared_pods
  pod 'Stripe'
  pod 'Alamofire'
  
  target 'E-ComTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'E-ComUITests' do
    # Pods for testing
  end

end

target 'E-ComAdmin' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for E-ComAdmin
  shared_pods
  pod 'CropViewController'
  
  target 'E-ComAdminTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'E-ComAdminUITests' do
    # Pods for testing
  end

end
