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
    
        starkHouse = House(name:"Stark",sigil:starkSigil,words:"Winter is coming",url: URL(string:"http://awoiaf.westeros.org/index.php/House_Stark")!)
        lannisterHouse = House(name:"Lannister",sigil:lannisterSigil,words:"Oye mi rugido",url: URL(string:"http://awoiaf.westeros.org/index.php/House_Lannister")!)
        
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
        let cersei = Person(name: "Cersei", alias:"La reina",house: lannisterHouse)
        let jaime = Person(name: "Jaime", alias: "Mata reyes", house:lannisterHouse)
        
        lannisterHouse.add(persons: cersei,jaime,jaime)
        XCTAssertEqual(lannisterHouse.count,2)
        
        
    }
  
    func textEquiality() {
        //Identidad
        XCTAssertEqual(starkHouse, starkHouse)
        //Igualdad
        let igualdadCasa=House(name: "Stark", sigil: starkSigil, words: "Se acerca el invierno",url: URL(string:"http://awoiaf.westeros.org/index.php/House_Stark")!)
        XCTAssertEqual(igualdadCasa, starkHouse)
        //No igualdad
        XCTAssertNotEqual(starkHouse, lannisterHouse)
    }
    //Control de hash de HOUSE
    func testHashable(){
        XCTAssertNotNil(starkHouse.hashValue)
    }
    
    func testHouseComparison(){
        XCTAssertLessThan(lannisterHouse,starkHouse)
        //XCTAssertGreaterThan(lannisterHouse, starkHouse)
    }

    
}
