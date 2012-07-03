class AppDelegate
  attr_reader :nav

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    Parse.setApplicationId(Config::Parse::AppId, clientKey:Config::Parse::ClientKey)
    PFTwitterUtils.initializeWithConsumerKey(Config::Twitter::ConsumerKey,
      consumerSecret:Config::Twitter::ConsumerSecret)
    root_view_controller = WidgetsController.alloc.initWithStyle(UITableViewStylePlain)
    @nav = UINavigationController.alloc.initWithRootViewController(root_view_controller)
    @nav.wantsFullScreenLayout = true
    @nav.toolbarHidden = true
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = @nav
    @window.makeKeyAndVisible
    true
  end
end
