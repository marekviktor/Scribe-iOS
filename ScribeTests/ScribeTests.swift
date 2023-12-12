//
//  ScribeTests.swift
//  ScribeTests
//
//  Created by Marek Viktor on 08/12/2023.
//

import XCTest
@testable import Scribe

final class ScribeTests: XCTestCase {
  func testAppDelegateLifecycle() {
    let appDelegate = AppDelegate()
    let application = UIApplication.shared
    XCTAssertTrue(appDelegate.application(application, didFinishLaunchingWithOptions: nil), "didFinishLaunchingWithOptions should return true")
    // Testujte ďalšie metódy životného cyklu, ak sú implementované
  }
  
  func testTableViewDataSource() {
    let viewController = AboutViewController()
    viewController.loadViewIfNeeded()
    
    let numberOfRows = viewController.tableView(viewController.outerTable, numberOfRowsInSection: 0)
    XCTAssertEqual(numberOfRows, viewController.tableData.count, "Number of rows should match tableData count")
    
    let indexPath = IndexPath(row: 0, section: 0)
    let cell = viewController.tableView(viewController.outerTable, cellForRowAt: indexPath) as? ParentTableViewCell
    XCTAssertNotNil(cell, "Cell should be of type ParentTableViewCell")
    // Overte ďalšie nastavenia bunky podľa potreby
  }
  
  
}
