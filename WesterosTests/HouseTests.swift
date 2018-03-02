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
        tyrion = Person(name:"Tyrion",alias:"El Enano",house:lannisterHouse, personImage: #imageLiteral(resourceName: "Tyrion-Lannister.jpg"), wikiURL: URL(string: "https://es.wikipedia.org/wiki/Tyrion_Lannister")!)
        arya = Person(name:"Aria",house:starkHouse, personImage: #imageLiteral(resourceName: "Arya.jpg"),wikiURL: URL(string: "https://es.wikipedia.org/wiki/Arya_Stark")!)
        roob = Person(name: "Robb", alias: "El Joven Lobo", house: starkHouse, personImage: #imageLiteral(resourceName: "Robb.jpg"),wikiURL: URL(string:"https://es.wikipedia.org/wiki/Robb_Stark")!)
    
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
        XCTAssertEqual(starkHouse.count, 2)
        
        starkHouse.add(person:roob)
        XCTAssertEqual(starkHouse.count, 2)
        
        starkHouse.add(person:roob)
        XCTAssertEqual(starkHouse.count, 2)
        
        starkHouse.add(person:arya)
        XCTAssertEqual(starkHouse.count, 2)
        
        starkHouse.add(person:tyrion)
        XCTAssertEqual(starkHouse.count, 2)
        
        lannisterHouse.add(person: roob)
        XCTAssertEqual(lannisterHouse.count, 1)
        let cersei = Person(name: "Cersei", house: lannisterHouse, personImage: #imageLiteral(resourceName: "Cersei.jpg"),wikiURL:URL(string:"https://es.wikipedia.org/wiki/Cersei_Lannister")!)
        let jaime = Person(name: "Jaime", alias: "Mata reyes", house:lannisterHouse, personImage: #imageLiteral(resourceName: "Jaime.jpg"),wikiURL: URL(string:"https://es.wikipedia.org/wiki/Jaime_Lannister")!)
        
        lannisterHouse.add(persons: cersei,jaime,jaime)
        XCTAssertEqual(lannisterHouse.count,3)
        
        
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
