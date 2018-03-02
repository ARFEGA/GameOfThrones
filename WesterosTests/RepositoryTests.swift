//
//  RepositoryTests.swift
//  WesterosTests
//
//  Created by ARMANDO on 13/2/18.
//  Copyright © 2018 ARMANDO. All rights reserved.
//

import XCTest
@testable import Westeros
class RepositoryTests: XCTestCase {
    
    var localHouses:[House]!
    var localSeasons:[Season]!
    
    
    override func setUp() {
        super.setUp()
        localHouses=Repository.local.houses
        localSeasons=Repository.local.seasons
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
   //Simular acceso rest api
    func testRepositoryCreation(){
        let local=Repository.local
        XCTAssertNotNil(local)
    }
    
    func testCreationHousesFromLocalRepository(){
        XCTAssertNotNil(localHouses)
        XCTAssertEqual(localHouses.count, 3)
    }
    
    func testLocalRepositoryReturnSortedArrayOfHouses()
    {
        XCTAssertEqual(localHouses, localHouses.sorted())
    }
    
    func testLocalRepositoryReturnHousesByCaseInsensitively(){
        let stark=Repository.local.house(named: "StArk")
        XCTAssertEqual(stark?.name, "Stark")
    }
    func testHousFiltering(){
        let filtered=Repository.local.houses(filteredBy:{$0.count==1})
        XCTAssertEqual(filtered.count, 1)
        let Filter2=Repository.local.houses(filteredBy: {$0.words.contains("Winter")})
        XCTAssertEqual(Filter2.count, 1)
    }
    
    func testSeasonFiltering(){
        //Sesiones que tengan 2 episodios
        let filtered=Repository.local.seasons(filteredBy:{$0.count==2})
        XCTAssertEqual(filtered.count, 7)
        //Sesiones que contengan Two en su nombre
        let Filter2=Repository.local.seasons(filteredBy: {$0.name.contains("Two") })
        XCTAssertEqual(Filter2.count, 1)
    }
    func testFuncAutocomplete(){
        let autocoplete = Repository.local.houseBySlogan(slogan: LocalFactory.Slogan.lanister)
        XCTAssertNotNil(autocoplete)
    }
 
 
    
    
    
    
    
    
    
    
}
