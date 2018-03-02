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
    var starkSigil:Sigil!
    var lannisterSigil:Sigil!
    
    var starkHouse:House!
    var lannisterHouse:House!
    
    var roob:Person!
    var arya:Person!
    var tyrion:Person!
    var ned:Person!
    
    override func setUp() {
        super.setUp()
       
        

        starkSigil=Sigil(image:UIImage(),description:"Lobo Huargo")
        lannisterSigil=Sigil(image:UIImage(),description:"Leon Rampante")
        
        starkHouse = House(name:"Stark",sigil:starkSigil,words:"Winter is coming",url: URL(string:"http://awoiaf.westeros.org/index.php/House_Stark")!)
        lannisterHouse = House(name:"Lannister",sigil:lannisterSigil,words:"Oye mi rugido",url: URL(string:"http://awoiaf.westeros.org/index.php/House_Lannister")!)
        
        tyrion = Person(name:"Tyrion",alias:"El Enano",house:lannisterHouse, personImage: #imageLiteral(resourceName: "Tyrion-Lannister.jpg"), wikiURL: URL(string: "https://es.wikipedia.org/wiki/Tyrion_Lannister")!)
        arya = Person(name:"Arya",house:starkHouse, personImage: #imageLiteral(resourceName: "Arya.jpg"),wikiURL: URL(string: "https://es.wikipedia.org/wiki/Arya_Stark")!)
        roob = Person(name: "Robb", alias: "El Joven Lobo", house: starkHouse, personImage: #imageLiteral(resourceName: "Robb.jpg"),wikiURL: URL(string:"https://es.wikipedia.org/wiki/Robb_Stark")!)
        
        
    }
    
    override func tearDown() {

        super.tearDown()
    }
    
    func textCharacterExistence(){
        XCTAssertNotNil(ned)
        XCTAssertNotNil(arya)
    }
    func testFullName(){
        XCTAssertEqual(arya.fullName,"Arya Stark")
        
    }
    
    func textPersonEquality(){
        //Comprobar
        //Identidad
        XCTAssertEqual(tyrion, tyrion)
        //Igualdad
        let enano=Person(name:"Tyrion",alias:"El Enano",house:lannisterHouse, personImage: #imageLiteral(resourceName: "Tyrion-Lannister.jpg"), wikiURL: URL(string: "https://es.wikipedia.org/wiki/Tyrion_Lannister")!)
        XCTAssertEqual(enano, tyrion)
        //Desigualdad
        XCTAssertNotEqual(tyrion, arya)
    }
    
    
}
