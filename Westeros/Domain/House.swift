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
    let wikiURL:URL
    
    private var _members: Members

    init(name:String,sigil:Sigil,words:Words,url:URL){
        self.name=name
        self.sigil=sigil
        self.words=words
        self.wikiURL=url
        _members=Members()
        
    }
}

extension House{
    //MARK - extended properties
    var count:Int{
        return _members.count
    }
    var SortedPersons:[Person]{
        return  _members.sorted (by: { $0.fullName < $1.fullName})
    }
    func add(person:Person){
        guard person.house.name == self.name else { return}
        _members.insert(person)
        
    }
    func add(persons:Person...){
        //Person..., se convierte en array
        //for person in persons{
        //    add(person:person)
        //}
        persons.forEach{add(person:$0)}
    }
}

//MARK: - Proxy igualdad
extension House{
    var proxyForEquiality:String{
        return "\(name)\(words)\(count)"
    }
    var proxyForComparision:String{
        return name.uppercased()
    }
}

// MARK: - Equatable
extension House:Equatable{
    static func ==(lhs: House, rhs: House) -> Bool {
        return lhs.proxyForEquiality == rhs.proxyForEquiality
    }
}
// MARK: - Hashable
extension House:Hashable{
    var hashValue:Int{
        return proxyForEquiality.hashValue
    }
}

//MARK: - Comparable
extension House:Comparable{
    static func <(lhs: House, rhs: House) -> Bool {
        return lhs.proxyForComparision < rhs.proxyForComparision
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
