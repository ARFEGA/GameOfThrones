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
        let starkSigil=Sigil(image:UIImage(),description:"Es un lobo")
        let stark = House(name:"Stark",sigil:starkSigil,words:"Winter is coming")
       // print(type(of: stark))
        XCTAssertNotNil(stark)
        // when
        // then
    }
    
  
    func testSigilExistence(){
        let starkSigil=Sigil(image:UIImage(),description:"Es un lobo")
        XCTAssertNotNil(starkSigil)
        let lannisterSigil=Sigil(image:UIImage(),description:"Leon Rampante")
        XCTAssertNotNil(lannisterSigil)
        
    }
    
}
