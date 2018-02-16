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
    
    
    override func setUp() {
        super.setUp()
        localHouses=Repository.local.houses
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
    
    
    
    
    
    
    
    
    
    
}
