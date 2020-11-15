import XCTest
@testable import Plummet

final class PlummetTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Plummet().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
