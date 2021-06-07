platform :ios, '11.0'

def trending_pods
  use_frameworks!

  pod 'Alamofire', '~> 5.4.3'
  pod 'Kingfisher', '~> 6.3.0'
end

target 'TrendingVenues' do
     trending_pods
end

  target 'TrendingVenuesTests' do
    trending_pods
  end

  target 'TrendingVenuesUITests' do
    trending_pods
  end

post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
            if ['CryptoSwift'].include? target.name
                config.build_settings['SWIFT_VERSION'] = '4.2'
            end
            config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '11.0'
            config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
        end
    end
end
