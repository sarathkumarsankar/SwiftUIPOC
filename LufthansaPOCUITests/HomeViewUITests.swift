//
//  HomeViewUITests.swift
//  LufthansaPOC
//
//  Created by Sarath on 29/09/24.
//


import XCTest

final class HomeViewUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launch()

        continueAfterFailure = false
    }
    
    override func tearDownWithError() throws {
        app = nil
    }

    func testTextFieldInput() throws {
        let textField = app.textFields["Enter something..."]
        XCTAssertTrue(textField.exists, "The text field should be present.")
        
        textField.tap()
        textField.typeText("Hello SwiftUI")

        XCTAssertEqual(textField.value as? String, "Hello SwiftUI", "The text field should contain the entered text.")
    }

    func testSubmitButtonTap() throws {
        let submitButton = app.buttons["Submit"]
        XCTAssertTrue(submitButton.exists, "The Submit button should be present.")
        
        submitButton.tap()

        let detailViewTitle = app.navigationBars["Detail View"]
        XCTAssertTrue(detailViewTitle.exists, "Should navigate to the Detail view on button tap.")
    }

    func testUIElementsExistence() throws {
        let textField = app.textFields["Enter something..."]
        let submitButton = app.buttons["Submit"]
        
        XCTAssertTrue(textField.exists, "TextField should exist")
        XCTAssertTrue(submitButton.exists, "Submit Button should exist")
    }
}
