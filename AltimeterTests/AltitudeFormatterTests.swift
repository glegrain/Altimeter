//
//  AltitudeFormatterTests.swift
//  Altimeter
//
//  Created by Guillaume Legrain on 9/18/16.
//  Copyright © 2016 Guillaume Legrain. All rights reserved.
//

import XCTest
@testable import Altimeter

class AltitudeFormatterTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func testZeroMeters() {
        let altitudeFormatter = AltitudeFormatter()
        let output = altitudeFormatter.mutableAttributtedStringFromLocationDistance(0)
        let expected = NSMutableAttributedString(string: "0 m")
        XCTAssert(output.isEqualToAttributedString(expected))
    }
    
    func testDecimalMeters() {
        let altitudeFormatter = AltitudeFormatter()
        let output = altitudeFormatter.mutableAttributtedStringFromLocationDistance(3.14159)
        let expected = NSMutableAttributedString(string: "3.1 m")
        expected.addAttribute(NSFontAttributeName, value: UIFont.systemFontOfSize(30), range: NSMakeRange(1, 2))
        XCTAssert(output.isEqualToAttributedString(expected))
    }
    
    func test4122Meters() {
        let altitudeFormatter = AltitudeFormatter()
        let output = altitudeFormatter.mutableAttributtedStringFromLocationDistance(4122)
        let expected = NSMutableAttributedString(string: "4 122 m")
        XCTAssert(output.isEqualToAttributedString(expected))
    }
    
    func test4122dot1Meters() {
        let altitudeFormatter = AltitudeFormatter()
        let output = altitudeFormatter.mutableAttributtedStringFromLocationDistance(4122.1)
        let expected = NSMutableAttributedString(string: "4 122.1 m")
        expected.addAttribute(NSFontAttributeName, value: UIFont.systemFontOfSize(30), range: NSMakeRange(5, 2))
        XCTAssert(output.isEqualToAttributedString(expected))
    }
    
    func test1000dot1Meters() {
        let altitudeFormatter = AltitudeFormatter()
        let output = altitudeFormatter.mutableAttributtedStringFromLocationDistance(1000.1)
        let expected = NSMutableAttributedString(string: "1 000.1 m")
        expected.addAttribute(NSFontAttributeName, value: UIFont.systemFontOfSize(30), range: NSMakeRange(5, 2))
        XCTAssert(output.isEqualToAttributedString(expected))
    }
    
    func test1000dot01Meters() {
        let altitudeFormatter = AltitudeFormatter()
        let output = altitudeFormatter.mutableAttributtedStringFromLocationDistance(1000.01)
        let expected = NSMutableAttributedString(string: "1 000 m")
        XCTAssert(output.isEqualToAttributedString(expected))
    }
    
    func test1000dot09Meters() {
        let altitudeFormatter = AltitudeFormatter()
        let output = altitudeFormatter.mutableAttributtedStringFromLocationDistance(1000.09)
        let expected = NSMutableAttributedString(string: "1 000.1 m")
        expected.addAttribute(NSFontAttributeName, value: UIFont.systemFontOfSize(30), range: NSMakeRange(5, 2))
        XCTAssert(output.isEqualToAttributedString(expected))
    }
    
}