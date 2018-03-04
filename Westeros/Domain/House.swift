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

final class House {
    let name:String
    var sigil:Sigil
    let words:String
    let wikiURL:URL
    
    private var _members: Members

    init(name:String,sigil:Sigil,words:Words,url:URL){
        self.name=name
        self.sigil=sigil
        self.words=words
        self.wikiURL=url
        _members=Members()
    }
//    private enum CodingKeys: String, CodingKey {
//        case name
//        case sigil
//        case words
//        case wikiURL
//    }
//
//    required init(from decoder:Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        self.name = try values.decode(String.self, forKey: .name)
//        self.words = try values.decode(String.self, forKey: .words)
//        self.wikiURL=try values.decode(String.self, forKey: .wikiURL)
//        self.sigil=try values.decode([String].self, forKey: .sigil)
//        _members=Members()
//    }
}

extension House{
    var count:Int{
        return _members.count
    }
    var sortedMembers:[Person]{
        return _members.sorted()
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
    let image:String
    
    init(image:String,description:String) {
        self.image=image
        self.description=description
    }
//    private enum CodingKeys: String, CodingKey {
//        case description
//        case image
//    }
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.description = try container.decode(String.self, forKey: .description)
//        self.image = try container.decode(String.self, forKey: .image)
//        let superDecoder=try container.superDecoder()
//        try super.init(from: superDecoder)
//
//    }
}
