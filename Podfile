source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '13.0'

def uikit_diffable_pods
  use_frameworks!
  pod 'LayoutExtension'
  pod 'DiffableDataSources', :git => 'https://github.com/absoftware/DiffableDataSources.git', :branch => 'sections'
end

target 'UIKitDiffable' do
    uikit_diffable_pods
end

target 'UIKitDiffableTests' do
    uikit_diffable_pods
end

post_install do |installer|
    installer.pods_project.build_configurations.each do |config|
        config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
    end
end
