use_frameworks!

target 'EasyToRemember' do 

#    pod 'SQLite.swift', '~> 0.11.3'
    pod 'RealmSwift'


end


post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
end
