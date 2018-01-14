Pod::Spec.new do |s|
  s.name = "Thyme"
  s.version = "2.0.0"
  s.summary = "A short description of Thyme."
  s.homepage = "https://github.com/kaishin/Thyme"
  s.social_media_url = "http://twitter.com/kaishin"
  s.license = { :type => "BSD", :file => "LICENSE" }
  s.author = { "Reda Lemeden" => "git@kaishin.haz.email" }
  s.source = { :git => "https://github.com/kaishin/Thyme.git", :tag => "v#{s.version}" }
  s.ios.source_files = "Thyme/**/*.{h,swift}"
  s.osx.source_files = "ThymeMac/**/*.{h,swift}"
  s.requires_arc = true
  s.ios.deployment_target = "10.0"
  s.osx.deployment_target = "10.10"
end

