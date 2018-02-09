//
//  Character.swift
//  Westeros
//
//  Created by ARMANDO on 8/2/18.
//  Copyright © 2018 ARMANDO. All rights reserved.
//

import Foundation

final class Person{
    let name : String
    let house: House
    private let _alias: String?
    
    var alias:String{
        //Mejor esta
        return _alias ?? ""
        //Esta es más larga
        //if let _alias=_alias{return _alias}else{return ""}
    }
    // MARK : - Inicializadores
    init(name:String, alias:String?=nil , house:House){
        self.name=name
        _alias=alias
        self.house=house
    }
}

extension Person{
    var fullName:String{
        return "\(name) \(house.name)"
    }
}
// MARK: - proxies
extension Person{
    var proxy:String{
        return "\(name)\(alias)\(house.name)"
    }
}
// MARK: - Hashable
extension Person:Hashable{
    var hashValue:Int{
        return proxy.hashValue
    }
}
// MARK: - Equatable
extension Person:Equatable{
    static func ==(lhs: Person, rhs: Person) -> Bool {
        return lhs.proxy == rhs.proxy
    }
    
    
}