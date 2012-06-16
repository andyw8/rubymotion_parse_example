class AppDelegate

  attr_reader :nav

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    Parse.setApplicationId(Config::PARSE_APP_ID, clientKey:Config::PARSE_CLIENT_KEY)
    @nav = UINavigationController.alloc.initWithRootViewController(WidgetsController.alloc.init)
    @nav.wantsFullScreenLayout = true
    @nav.toolbarHidden = true
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = @nav
    @window.makeKeyAndVisible
    true
  end
end
