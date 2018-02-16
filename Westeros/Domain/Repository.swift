//
//  Repository.swift
//  Westeros
//
//  Created by ARMANDO on 13/2/18.
//  Copyright © 2018 ARMANDO. All rights reserved.
//

import UIKit


final class Repository{
    static let local=LocalFactory()
    //static let remote
    //init(
}

protocol HouseFactory{
    typealias Filter = (House) -> Bool
    var houses : [House] { get }
    func house(named: String) -> House?
    func houses(filteredBy:Filter)->[House]
}

final class LocalFactory : HouseFactory{
    
    
    //Al solo tener una propiedad computada no es necesário init
    //init(houses:[])
    var houses: [House]{
        //House creation here
        
        //SIGIL
        let starkSigil=Sigil(image: #imageLiteral(resourceName: "codeIsComing.png") , description: "Lobo Huargo")
        let lannisterSigil=Sigil(image:#imageLiteral(resourceName: "lannister.jpg") , description: "Leon Rampante")
        let targaryenSigil=Sigil(image: #imageLiteral(resourceName: "targaryenSmall.jpg"), description: "Dragón tricefalo")
        
        //HOUSES
        let starkHouse = House(name:"Stark",sigil:starkSigil,words:"Winter is coming", url: URL(string:"https://awoiaf.westeros.org/index.php/House_Stark")!)
        let lannisterHouse = House(name:"Lannister",sigil:lannisterSigil,words:"Oye mi rugido", url: URL(string:"https://awoiaf.westeros.org/index.php/House_Lannister")!)
        let targaryenHouse = House(name: "Targaryen", sigil: targaryenSigil, words: "Fuego y sangre", url: URL(string:"https://awoiaf.westeros.org/index.php/House_Targaryen")!)
        
        
        //PERSONS
        let tyrion = Person(name:"Tyrion",alias:"El Enano",house:lannisterHouse)
        let arya = Person(name:"Aria",house:starkHouse)
        let roob = Person(name: "Robb", alias: "El Joven Lobo", house: starkHouse)
        let cersei = Person(name: "Cersei", house: lannisterHouse)
        let jaime = Person(name: "Jaime", alias: "Mata reyes", house:lannisterHouse)
        let dani=Person(name: "Daenerys", alias: "Madre de dragones", house: targaryenHouse)
        
        starkHouse.add(person:arya)
        starkHouse.add(person:roob)
        lannisterHouse.add(person:tyrion)
        lannisterHouse.add(person:cersei)
        lannisterHouse.add(person:jaime)
        targaryenHouse.add(person: dani)
        
        return [targaryenHouse, starkHouse,lannisterHouse].sorted()
    }
    
    func house(named name: String) -> House? {
        let house=houses.filter{ $0.name.uppercased() == name.uppercased()}.first
        return house
    }
    func houses(filteredBy: Filter) -> [House] {
        return houses.filter(filteredBy)
    }
    
}


