$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'

Motion::Project::App.setup do |app|
  app.name = 'Parse Example'

  ## -- Parse ## 

  app.libs << '/usr/lib/libz.1.1.3.dylib'
  app.frameworks += [
    'AudioToolbox',
    'CFNetwork',
    'SystemConfiguration',
    'MobileCoreServices',
    'Security',
    'QuartzCore']
  app.name = 'Parse Test'
  app.vendor_project('vendor/Parse.framework',
                     :static,
                     :products => ['Parse'],
                     :headers_dir => 'Headers')
end
