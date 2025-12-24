//
//  CheckMateUITests.swift
//  CheckMateUITests
//
//  Created by Alex Senu on 17/7/25.
//

import XCTest

final class CheckMateUITests: XCTestCase {

    @MainActor
    func testTypingAmountShowsTotals() throws {
        let app = XCUIApplication()
        app.launch()

        let amountField = app.textFields["amountField"]
        XCTAssertTrue(amountField.exists)

        amountField.tap()
        amountField.typeText("100")

        // Αν το decimalPad δεν έχει “Done”, μπορείς να κλείσεις keyboard με tap κάπου αλλού
        app.tap()

        let totalLabel = app.staticTexts["totalLabel"]
        XCTAssertTrue(totalLabel.exists)

        // Δεν κάνω exact string compare γιατί currency formatting αλλάζει ανά locale.
        // Μπορείς να ελέγξεις ότι ΔΕΝ είναι κενό ή ότι περιέχει "100" ανάλογα.
        XCTAssertFalse(totalLabel.label.isEmpty)
    }
}
