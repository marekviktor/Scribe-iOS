/**
 * Class of methods to manage Scribe's behaviors.
 *
 * Copyright (C) 2023 Scribe
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

import CoreData
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?

  func application(
    _: UIApplication,
    didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // Override point for customization after application launch.
    return true
  }

  func applicationWillResignActive(_: UIApplication) {
    /*
      Sent when the application is about to move from active to inactive state.
      This can occur for certain types of temporary interruptions:
        - Incoming phone call or SMS message
        - When the user quits the application and it begins the transition to the background state
      Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks.
      Games should use this method to pause the game.
     */
  }

  func applicationDidEnterBackground(_: UIApplication) {
    /*
      Use this method to:
        - Release shared resources
        - Save user data
        - Invalidate timers
        - Store enough application state information to restore your application to its current state
          - This is in case it is terminated later

      If your application supports background execution:
        - This method is called instead of applicationWillTerminate: when the user quits
     */

    /// Hacky fix to update installed keyboard list.
    /// This is needed because list will only update on viewWillAppear.
    /// Thus, if we redirect the user to the first screen when leaving the app then viewWillAppear is always be called when going back to the Settings screen.
    /// Needs a better implementation.
    if let tabBarController = window?.rootViewController as? UITabBarController {
      if tabBarController.selectedIndex == 1 {
        tabBarController.selectedIndex = 0
      }
    }
  }

  func applicationWillEnterForeground(_: UIApplication) {
    /*
      Called as part of the transition from the background to the active state.
      Here you can undo many of the changes made on entering the background.
     */
  }

  func applicationDidBecomeActive(_: UIApplication) {
    /*
      Restart any tasks that were paused (or not yet started) while the application was inactive.
      If the application was previously in the background, optionally refresh the user interface.
     */
  }

  func applicationWillTerminate(_: UIApplication) {
    /*
      Called when the application is about to terminate.
      Save data if appropriate.
      See also applicationDidEnterBackground:.
      Saves changes in the application's managed object context before the application terminates.
     */
    saveContext()
  }

  // MARK: - Core Data stack

  lazy var persistentContainer: NSPersistentContainer = {
    /*
      The persistent container for the application. This implementation
      creates and returns a container, having loaded the store for the
      application to it. This property is optional since there are legitimate
      error conditions that could cause the creation of the store to fail.
     */
    let container = NSPersistentContainer(name: "Scribe")
    container.loadPersistentStores(completionHandler: { _, error in
      if let error = error as NSError? {
        /*
          Replace this implementation with code to handle the error appropriately.
          fatalError() causes the application to generate a crash log and terminate.
          You should not use this function in a shipping application, although it may be useful during development.
         */

        /*
          Typical reasons for an error here include:
            - The parent directory does not exist, cannot be created, or disallows writing.
            - The persistent store is not accessible, due to permissions or data protection when the device is locked.
            - The device is out of space.
            - The store could not be migrated to the current model version.
          Check the error message to determine what the actual problem was.
         */

        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    })
    return container
  }()

  // MARK: - Core Data Saving support

  func saveContext() {
    let context = persistentContainer.viewContext
    if context.hasChanges {
      do {
        try context.save()
      } catch {
        /*
          Replace this implementation with code to handle the error appropriately.
          fatalError() causes the application to generate a crash log and terminate.
          You should not use this function in a shipping application, although it may be useful during development.
         */
        let nserror = error as NSError
        fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
      }
    }
  }
}
