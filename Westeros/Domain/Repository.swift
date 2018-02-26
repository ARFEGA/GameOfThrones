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

protocol GameThronesFactory{
    typealias FilterHouse = (House) -> Bool
    func houses(filteredBy:FilterHouse)->[House]
    
    typealias FilterSeason = (Season) -> Bool
    func seasons(filteredBy:FilterSeason) -> [Season]
    
    var houses : [House] { get }
    func house(named: String) -> House?
   
}

final class LocalFactory : GameThronesFactory{
    var seasons: [Season]{
        //MARK: - Seasons
        
        let season1=Season(number: 1, name: "Season One", date:Date().buildShortDateFromArguments(day: 17, month: Month.April, year: 2011), image:#imageLiteral(resourceName: "Season_1.jpg"))
        let season2=Season(number: 2, name: "Season Two", date: Date().buildShortDateFromArguments(day: 1, month: Month.April , year: 2012),image:#imageLiteral(resourceName: "Season_2.jpg"))
        let season3=Season(number: 3, name: "Season Three", date: Date().buildShortDateFromArguments(day: 31, month: Month.March, year: 2013),image:#imageLiteral(resourceName: "Season_3.jpg"))
        let season4=Season(number: 4, name: "Season Four", date: Date().buildShortDateFromArguments(day: 6, month: Month.April, year: 2014),image:#imageLiteral(resourceName: "Season_4.jpg"))
        let season5=Season(number: 5, name: "Season Five", date: Date().buildShortDateFromArguments(day: 12, month: Month.April, year: 2015),image:#imageLiteral(resourceName: "Season_5.png"))
        let season6=Season(number: 6, name: "Season Six", date: Date().buildShortDateFromArguments(day: 24, month: Month.April, year: 2016),image:#imageLiteral(resourceName: "Season_6.jpg"))
        let season7=Season(number: 7, name: "Season Seven", date: Date().buildShortDateFromArguments(day: 16, month: Month.July, year: 2017),image:#imageLiteral(resourceName: "Season_7.png"))
        
        
        //MARK: - Episodes
        let S1E1=Episode(title: "Winter is comming", emissionDate:Date().buildShortDateFromArguments(day: 17, month: Month.April, year: 2011), season: season1)
        let S1E2=Episode(title: "The Kingsroad", emissionDate:Date().buildShortDateFromArguments(day: 24, month: Month.April, year: 2011), season: season1)
        
        let S2E1=Episode(title: "The North Remembers", emissionDate:Date().buildShortDateFromArguments(day: 1, month: Month.April, year: 2012), season: season2)
        let S2E2=Episode(title: "The Night Lands", emissionDate:Date().buildShortDateFromArguments(day: 8, month: Month.April, year: 2012), season: season2)
        
        let S3E1=Episode(title: "Valar Dohaeris", emissionDate:Date().buildShortDateFromArguments(day: 31, month: Month.March, year: 2013), season: season3)
        let S3E2=Episode(title: "Dark Wings, Dark Words", emissionDate:Date().buildShortDateFromArguments(day: 7, month: Month.April, year: 2013), season: season3)
        
        let S4E1=Episode(title: "Two Swords", emissionDate:Date().buildShortDateFromArguments(day: 6, month: Month.April, year: 2014), season: season4)
        let S4E2=Episode(title: "The Lion and the Rose", emissionDate:Date().buildShortDateFromArguments(day: 13, month: Month.April, year: 2014), season: season4)
        
        let S5E1=Episode(title: "The Wars to Come", emissionDate:Date().buildShortDateFromArguments(day: 12, month: Month.April, year: 2015), season: season5)
        let S5E2=Episode(title: "The House of Black and White", emissionDate:Date().buildShortDateFromArguments(day: 19, month: Month.April, year: 2015), season: season5)
        
        let S6E1=Episode(title: "The Red Woman", emissionDate:Date().buildShortDateFromArguments(day: 24, month: Month.April, year: 2016), season: season6)
        let S6E2=Episode(title: "Home", emissionDate:Date().buildShortDateFromArguments(day: 1, month: Month.May, year: 2016), season: season6)
        
        let S7E1=Episode(title: "Dragonstone", emissionDate:Date().buildShortDateFromArguments(day: 16, month: Month.July, year: 2017), season: season7)
        let S7E2=Episode(title: "Stormborn", emissionDate:Date().buildShortDateFromArguments(day: 23, month: Month.July, year: 2017), season: season7)
       
        season1.add(episodes: S1E1,S1E2)
        season2.add(episodes: S2E1,S2E2)
        season3.add(episodes: S3E1,S3E2)
        season4.add(episodes: S4E1,S4E2)
        season5.add(episodes: S5E1,S5E2)
        season6.add(episodes: S6E1,S6E2)
        season7.add(episodes: S7E1,S7E2)
        
        
        
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
    func houses(filteredBy: FilterHouse) -> [House] {
        return houses.filter(filteredBy)
    }
    
    func season(named name: String) -> Season? {
        let season=seasons.filter{ $0.name.uppercased() == name.uppercased()}.first
        return season
    }
    func seasons(filteredBy: FilterSeason) -> [Season] {
        return seasons.filter(filteredBy)
    }
    
}


