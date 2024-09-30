//
//  DetailViewUITests.swift
//  LufthansaPOC
//
//  Created by Sarath on 29/09/24.
//


import XCTest

final class DetailViewUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launch()
        continueAfterFailure = false
    }
    
    override func tearDownWithError() throws {
        app = nil
    }

    func testDisplayedTextInDetailView() throws {
        let textField = app.textFields["Enter something..."]
        XCTAssertTrue(textField.exists, "The text field should be present.")
        textField.tap()
        textField.typeText("Hello SwiftUI")
        
        let submitButton = app.buttons["Submit"]
        XCTAssertTrue(submitButton.exists, "Submit button should exist in HomeView.")
        submitButton.tap()
        
        let detailText = app.staticTexts.element(matching: .any, identifier: "DetailText")
        XCTAssertTrue(detailText.exists, "The text in DetailView should be displayed.")
        XCTAssertEqual(detailText.label, "Hello SwiftUI", "The DetailView should display the correct text from the ViewModel.")
    }

    func testNavigationTitleInDetailView() throws {
        let submitButton = app.buttons["Submit"]
        submitButton.tap()
        let detailNavBar = app.navigationBars["Detail View"]
        XCTAssertTrue(detailNavBar.exists, "The navigation bar should show 'Detail View' as the title.")
    }
}
