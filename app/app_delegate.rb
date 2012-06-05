class AppDelegate

  attr_reader :nav

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    Parse.setApplicationId(Config::APP_ID, clientKey:Config::CLIENT_KEY)
    @nav = UINavigationController.alloc.initWithRootViewController(WidgetsController.alloc.init)
    @nav.wantsFullScreenLayout = true
    @nav.toolbarHidden = true
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = @nav
    @window.makeKeyAndVisible
    true
  end
end
