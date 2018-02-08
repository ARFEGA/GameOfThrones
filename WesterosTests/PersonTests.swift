//
//  CharacterTests.swift
//  WesterosTests
//
//  Created by ARMANDO on 8/2/18.
//  Copyright © 2018 ARMANDO. All rights reserved.
//

import XCTest
@testable import Westeros

class PersonTests: XCTestCase {
    var starkHouse:House!
    var starkSigil:Sigil!
    var ned:Person!
    var arya:Person!
    
    override func setUp() {
        super.setUp()
        starkSigil=Sigil(image:UIImage(),description:"Es un Huargo")
        starkHouse=House(name:"Stark",sigil:starkSigil,words:"Winter is coming")
        ned = Person(name:"Eddard",alias:"Ned",house:starkHouse)
        arya = Person(name:"Aria",house:starkHouse)
    }
    
    override func tearDown() {

        super.tearDown()
    }
    
    func textCharacterExistence(){
        XCTAssertNotNil(ned)
        XCTAssertNotNil(arya)
    }
    func testFullName(){
        XCTAssertEqual(ned.fullName,"Eddard Stark")
        
    }
    
    
}
