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
    
    override func setUp() {
        super.setUp()
        starkSigil=Sigil(image:UIImage(),description:"Es un lobo")
        starkHouse=House(name:"Stark",sigil:starkSigil,words:"Winter is coming")
    }
    
    override func tearDown() {

        super.tearDown()
    }
    
    func textCharacterExistence(){
        
        let ned = Person(name:"Eddard",alias:"Ned",house:starkHouse)
          XCTAssertNotNil(ned)
        
         let arya = Person(name:"Aria",house:starkHouse)
        XCTAssertNotNil(arya)
    }
    
    
}
