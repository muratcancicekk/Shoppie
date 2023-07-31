# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Definex' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Definex

 post_install do |installer|
    installer.generated_projects.each do |project|
      project.targets.each do |target|
        target.build_configurations.each do |config|
          config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "i386 arm64"
        end
      end
    end
  end
  
  # Pods for Definex
  pod 'SwiftLint'
  pod 'FirebaseRemoteConfig', '~> 9.6.0'
  pod 'FirebaseCrashlytics', '~> 9.6.0'
  pod 'FirebaseAnalytics', '~> 9.6.0'

  target 'DefinexTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'DefinexUITests' do
    # Pods for testing
  end

end
