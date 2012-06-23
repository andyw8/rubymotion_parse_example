class AppDelegate
  attr_reader :nav

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    Parse.setApplicationId(Config::PARSE_APP_ID, clientKey:Config::PARSE_CLIENT_KEY)
    PFTwitterUtils.initializeWithConsumerKey(Config::TWITTER_CONSUMER_KEY,
      consumerSecret:Config::TWITTER_CONSUMER_SECRET)
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
