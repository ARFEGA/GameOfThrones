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
    init(name:String, alias:String , house:House){
        self.name=name
        _alias=alias
        self.house=house
    }
    init(name:String,house:House)
    {
        self.name=name
        self.house=house
        _alias=nil
    }
}
