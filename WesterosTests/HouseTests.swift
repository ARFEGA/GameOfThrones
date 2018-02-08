//
//  HouseTests.swift
//  WesterosTests
//
//  Created by ARMANDO on 8/2/18.
//  Copyright © 2018 ARMANDO. All rights reserved.
//

import XCTest
@testable import Westeros


class HouseTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
       
    }
    
    override func tearDown() {
      
        super.tearDown()
    }
    
    func testHouseExistence(){
        // given
        let stark = House()
        XCTAssertNotNil(stark)
        // when
        // then
    }
    
}
