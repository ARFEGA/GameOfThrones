//
//  Character.swift
//  Westeros
//
//  Created by ARMANDO on 8/2/18.
//  Copyright © 2018 ARMANDO. All rights reserved.
//

import UIKit

final class Person{
    let name : String
    let house: House//Poner esta a weak
    let personImage:String
    let wikiURL:String
    private let _alias: String?
    
    var alias:String{
        //Mejor esta
        return _alias ?? ""
        //Esta es más larga
        //if let _alias=_alias{return _alias}else{return ""}
    }
    // MARK : - Inicializadores
    init(name:String, alias:String?=nil , house:House,personImage:String,wikiURL:String){
        self.name=name
        _alias=alias
        self.house=house
        self.personImage=personImage
        self.wikiURL=wikiURL
        //MARK: - 11 OPCIONAL
        house.add(person: self)
    }
}

extension Person{
    var fullName:String{
        return "\(name) \(house.name)"
    }
}
// MARK: - proxies
extension Person{
    var proxyForEquatable:String{
        return "\(name)\(alias)\(house.name)"
    }
    var proxyForComparision:String{
        return fullName
    }
}
// MARK: - Hashable
extension Person:Hashable{
    var hashValue:Int{
        return proxyForEquatable.hashValue
    }
}
// MARK: - Equatable
extension Person:Equatable{
    static func ==(lhs: Person, rhs: Person) -> Bool {
        return lhs.proxyForEquatable == rhs.proxyForEquatable
    }
}

//MARK: - Comparable
extension Person:Comparable{
    static func <(lhs: Person, rhs: Person) -> Bool {
        return lhs.proxyForComparision < rhs.proxyForComparision
    }
}

