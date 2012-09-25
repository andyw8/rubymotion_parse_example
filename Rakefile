$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'

require 'bundler'
Bundler.require

require 'bubble-wrap'
require 'ParseModel'

Motion::Project::App.setup do |app|
  app.name = 'Parse Example'
  app.files_dependencies 'app/controllers/widget_detail_controller.rb' => 'app/lib/buttons.rb'
  app.files_dependencies 'app/controllers/widgets_controller.rb' => [
    'app/lib/displays_login_controller.rb',
    'app/delegates/signup_view_controller_delegate.rb',
    'app/lib/controller_operations/add.rb',
    'app/lib/controller_operations/show.rb',
    'app/lib/reuseable_cell.rb']

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
