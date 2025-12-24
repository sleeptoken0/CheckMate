//
//  CheckMateTests.swift
//  CheckMateTests
//
//  Created by Alex Senu on 17/7/25.
//

import Testing
@testable import CheckMate

struct BillSplitter {
    static func totalAmount(checkAmount: Double, tipPercentage: Int) -> Double {
        checkAmount + (checkAmount * Double(tipPercentage) / 100.0)
    }

    static func totalPerPerson(checkAmount: Double, tipPercentage: Int, numberOfPeople: Int) -> Double {
        let total = totalAmount(checkAmount: checkAmount, tipPercentage: tipPercentage)
        return total / Double(numberOfPeople)
    }
}

struct CheckMateTests {

    @Test func totalsAreCorrect() throws {
        #expect(BillSplitter.totalAmount(checkAmount: 100, tipPercentage: 20) == 120)
        #expect(BillSplitter.totalPerPerson(checkAmount: 100, tipPercentage: 20, numberOfPeople: 4) == 30)
    }

    @Test func zeroTipWorks() throws {
        #expect(BillSplitter.totalAmount(checkAmount: 80, tipPercentage: 0) == 80)
        #expect(BillSplitter.totalPerPerson(checkAmount: 80, tipPercentage: 0, numberOfPeople: 2) == 40)
    }
}

