Pod::Spec.new do |s|
  s.name         = "NutUtils"
  s.version      = "1.1.3"
  s.summary      = "SDK que contiene extensiones y funciones de utilidad"
  s.description  = <<-DESC
                  Es un framework que contiene todas las utilidades que a lo largo del tiempo a usado Nut Systems en su desarrollo.
                   DESC
  s.homepage     = "https://www.nut.com.mx"
  s.license      = "Nut Systems Copyright 2021"
  s.author             = { "Miguel Mexicano Herrera" => "miguelmexicano18@gmail.com " }
  s.platform     = :ios, "11.0"
  s.ios.deployment_target = '11.0'
  s.swift_version = '5.0'
  s.requires_arc = true
  s.source       = { :git => "https://github.com/migue19/NutUtils.git", :tag => "#{s.version}" }
  s.license      = {
    :type => 'Copyright',
    :text => <<-LICENSE
      Copyright 2021 Nut Systems, Inc. All rights reserved.
      LICENSE
  }
  s.source_files  = "NutUtils/Classes/**/*.{swift}"
    #s.subspec 'Optionals' do |optionals|
     #   optionals.source_files = 'NutUtils/Classes/Extensions/Optionals/*.{swift}'
    #end
    #s.subspec 'UIImage' do |uiimage|
     #   uiimage.source_files = 'NutUtils/Classes/Extensions/UIImage/*.{swift}'
    #end
    #s.subspec 'UIView' do |uiview|
     #   uiview.source_files = 'NutUtils/Classes/Extensions/UIView/*.{swift}'
    #end  
end

