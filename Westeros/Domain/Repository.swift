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

protocol SerieFactory{
    typealias Filter = (House) -> Bool
    var houses : [House] { get }
    func house(named: String) -> House?
    func houses(filteredBy:Filter)->[House]
}

final class LocalFactory : SerieFactory{
    var seasons: [Season]{
        //MARK: - Seasons
        let season1=Season(number: 1, name: "Season One", date: Date())
        let season2=Season(number: 2, name: "Season Two", date: Date())
        let season3=Season(number: 3, name: "Season Three", date: Date())
        let season4=Season(number: 4, name: "Season Four", date: Date())
        let season5=Season(number: 5, name: "Season Five", date: Date())
        let season6=Season(number: 6, name: "Season Six", date: Date())
        let season7=Season(number: 7, name: "Season Seven", date: Date())
    
        //MARK: - Episodes
        let E1S1=Episode(title: "Winter is comming", emissionDate:Date(), season: season1)
        
        
        
        return [season1,season2,season3,season4,season5,season6,season7].sorted()
    }
    
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
        let tyrion = Person(name:"Tyrion",alias:"El Enano",house:lannisterHouse, personImage: #imageLiteral(resourceName: "Tyrion-Lannister.jpg"), wikiURL: URL(string: "https://es.wikipedia.org/wiki/Tyrion_Lannister")!)
        let arya = Person(name:"Aria",house:starkHouse, personImage: #imageLiteral(resourceName: "Arya.jpg"),wikiURL: URL(string: "https://es.wikipedia.org/wiki/Arya_Stark")!)
        let roob = Person(name: "Robb", alias: "El Joven Lobo", house: starkHouse, personImage: #imageLiteral(resourceName: "Robb.jpg"),wikiURL: URL(string:"https://es.wikipedia.org/wiki/Robb_Stark")!)
        let cersei = Person(name: "Cersei", house: lannisterHouse, personImage: #imageLiteral(resourceName: "Cersei.jpg"),wikiURL:URL(string:"https://es.wikipedia.org/wiki/Cersei_Lannister")!)
        let jaime = Person(name: "Jaime", alias: "Mata reyes", house:lannisterHouse, personImage: #imageLiteral(resourceName: "Jaime.jpg"),wikiURL: URL(string:"https://es.wikipedia.org/wiki/Jaime_Lannister")!)
        let dani=Person(name: "Daenerys", alias: "Madre de dragones", house: targaryenHouse, personImage: #imageLiteral(resourceName: "Daenerys.jpg"),wikiURL: URL(string:"https://es.wikipedia.org/wiki/Daenerys_Targaryen")!)
        
        starkHouse.add(persons: arya,roob,roob)
        lannisterHouse.add(persons: tyrion,cersei,jaime)
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


