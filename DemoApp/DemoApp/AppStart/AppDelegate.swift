import AppFolder
import Shared
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder {
	/// The reference to the window.
	var window: UIWindow?

	/// The dependency injection container.
	private let dependencies = AppDelegateDependencyContainer()

	// weaver: scene1VC = Scene1VC <- UIViewController
	// weaver: scene1VC.scope = .transient

	// weaver: settings = InternalSettings <- InternalSettingsInterface
	// weaver: settings.scope = .container
}

// MARK: - UIApplicationDelegate

extension AppDelegate: UIApplicationDelegate {
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		// Setup logger.
		Log.setup()
		Log.debug("App's home directory:\n\n\(AppFolder.baseURL.path)\n\n------")

		// Create window.
		let window = UIWindow(frame: UIScreen.main.bounds)
		self.window = window
		window.backgroundColor = R.color.defaultBackground()

		// Prepare initial scene.
		let setupModel = Scene1Setup()
		let scene = dependencies.scene1VC(setupModel: setupModel)
		let navController = BaseNavigationController(rootViewController: scene)

		// Show the scene.
		window.rootViewController = navController
		window.makeKeyAndVisible()

		// Make sure device orientation changes are broadcasted.
		UIDevice.current.beginGeneratingDeviceOrientationNotifications()

		return true
	}

	func applicationWillResignActive(_ application: UIApplication) {}

	func applicationDidEnterBackground(_ application: UIApplication) {}

	func applicationWillEnterForeground(_ application: UIApplication) {}

	func applicationDidBecomeActive(_ application: UIApplication) {}

	func applicationWillTerminate(_ application: UIApplication) {}
}
