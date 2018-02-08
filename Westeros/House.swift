//
//  House.swift
//  Westeros
//
//  Created by ARMANDO on 8/2/18.
//  Copyright © 2018 ARMANDO. All rights reserved.
//


import UIKit



typealias Words = String

//Con set, alamacenamos elementos y no permite que estén duplicados a dierencia de un array
typealias Members = Set<Person>

final class House{
    let name:String
    let sigil: Sigil
    let words:Words
    
    private var _members: Members

    init(name:String,sigil:Sigil,words:Words){
        self.name=name
        self.sigil=sigil
        self.words=words
        _members=Members()
    }
}

extension House{
    var count:Int{
        return _members.count
    }
    func add(person:Person){
        guard person.house.name == self.name else { return}
        _members.insert(person)
        
    }
}

final class Sigil{
    let description: String
    let image:UIImage
    init(image:UIImage,description:String) {
        self.image=image
        self.description=description
    }
}
