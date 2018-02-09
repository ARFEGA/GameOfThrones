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
    var starkSigil:Sigil!
    var lannisterSigil:Sigil!
    var starkHouse:House!
    var lannisterHouse:House!
    
    var roob:Person!
    var arya:Person!
    var tyrion:Person!
    
    
    override func setUp() {
        starkSigil=Sigil(image:UIImage(),description:"Lobo Huargo")
        lannisterSigil=Sigil(image:UIImage(),description:"Leon Rampante")
        starkHouse = House(name:"Stark",sigil:starkSigil,words:"Winter is coming")
        lannisterHouse = House(name:"Lannister",sigil:lannisterSigil,words:"Oye mi rugido")
        tyrion = Person(name:"Tyrion",alias:"El Enano",house:lannisterHouse)
        arya = Person(name:"Aria",house:starkHouse)
        roob = Person(name: "Robb", alias: "El Joven Lobo", house: starkHouse)
        
        
        super.setUp()
       
    }
    
    override func tearDown() {
      
        super.tearDown()
    }
    
    func testHouseExistence(){
      
        XCTAssertNotNil(starkHouse)
          XCTAssertNotNil(lannisterHouse)
        
       
    }
    
  
    func testSigilExistence(){
        
        XCTAssertNotNil(starkSigil)
       
        XCTAssertNotNil(lannisterSigil)
        
    }
    func testAddPerson(){
        XCTAssertEqual(starkHouse.count, 0)
        
        starkHouse.add(person:roob)
        XCTAssertEqual(starkHouse.count, 1)
        
        starkHouse.add(person:roob)
        XCTAssertEqual(starkHouse.count, 1)
        
        starkHouse.add(person:arya)
        XCTAssertEqual(starkHouse.count, 2)
        
        starkHouse.add(person:tyrion)
        XCTAssertEqual(starkHouse.count, 2)
        
        lannisterHouse.add(person: roob)
        XCTAssertEqual(lannisterHouse.count, 0)
    }
  
    
}
