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
        
        let season1=Season(number: 1, name: "Season One", date:Date().buildShortDateFromArguments(day: 17, month: Month.April, year: 2011), image:#imageLiteral(resourceName: "Season_1.jpg"), plot: TRAMA_SEASON_1)
        let season2=Season(number: 2, name: "Season Two", date: Date().buildShortDateFromArguments(day: 1, month: Month.April , year: 2012),image:#imageLiteral(resourceName: "Season_2.jpg"), plot: TRAMA_SEASON_2)
        let season3=Season(number: 3, name: "Season Three", date: Date().buildShortDateFromArguments(day: 31, month: Month.March, year: 2013),image:#imageLiteral(resourceName: "Season_3.jpg"), plot: TRAMA_SEASON_3)
        let season4=Season(number: 4, name: "Season Four", date: Date().buildShortDateFromArguments(day: 6, month: Month.April, year: 2014),image:#imageLiteral(resourceName: "Season_4.jpg"), plot: TRAMA_SEASON_4)
        let season5=Season(number: 5, name: "Season Five", date: Date().buildShortDateFromArguments(day: 12, month: Month.April, year: 2015),image:#imageLiteral(resourceName: "Season_5.png"), plot: TRAMA_SEASON_5)
        let season6=Season(number: 6, name: "Season Six", date: Date().buildShortDateFromArguments(day: 24, month: Month.April, year: 2016),image:#imageLiteral(resourceName: "Season_6.jpg"), plot: TRAMA_SEASON_6)
        let season7=Season(number: 7, name: "Season Seven", date: Date().buildShortDateFromArguments(day: 16, month: Month.July, year: 2017),image:#imageLiteral(resourceName: "Season_7.png"), plot: TRAMA_SEASON_7)
        
        
        //MARK: - Episodes
        _=Episode(title: "Winter is comming", emissionDate:Date().buildShortDateFromArguments(day: 17, month: Month.April, year: 2011), season: season1, number: 1, wikiURL:URL(string:"https://es.wikipedia.org/wiki/Se_acerca_el_invierno")!)
        _=Episode(title: "The Kingsroad", emissionDate:Date().buildShortDateFromArguments(day: 24, month: Month.April, year: 2011), season: season1, number: 2, wikiURL:URL(string:"https://es.wikipedia.org/wiki/El_Camino_Real")!)
        
        _=Episode(title: "The North Remembers", emissionDate:Date().buildShortDateFromArguments(day: 1, month: Month.April, year: 2012), season: season2, number: 1, wikiURL:URL(string:"https://es.wikipedia.org/wiki/El_Norte_no_olvida")!)
        _=Episode(title: "The Night Lands", emissionDate:Date().buildShortDateFromArguments(day: 8, month: Month.April, year: 2012), season: season2, number: 2, wikiURL:URL(string:"https://es.wikipedia.org/wiki/Las_tierras_de_la_noche")!)
        
        _=Episode(title: "Valar Dohaeris", emissionDate:Date().buildShortDateFromArguments(day: 31, month: Month.March, year: 2013), season: season3, number: 1, wikiURL:URL(string:"https://es.wikipedia.org/wiki/Valar_Dohaeris")!)
        _=Episode(title: "Dark Wings, Dark Words", emissionDate:Date().buildShortDateFromArguments(day: 7, month: Month.April, year: 2013), season: season3, number: 2, wikiURL:URL(string:"https://es.wikipedia.org/wiki/Alas_negras,_palabras_negras")!)
        
        _=Episode(title: "Two Swords", emissionDate:Date().buildShortDateFromArguments(day: 6, month: Month.April, year: 2014), season: season4, number: 1, wikiURL:URL(string:"https://es.wikipedia.org/wiki/Dos_espadas_(Juego_de_tronos)")!)
        _=Episode(title: "The Lion and the Rose", emissionDate:Date().buildShortDateFromArguments(day: 13, month: Month.April, year: 2014), season: season4, number: 2, wikiURL:URL(string:"https://es.wikipedia.org/wiki/El_le%C3%B3n_y_la_rosa")!)
        
        _=Episode(title: "The Wars to Come", emissionDate:Date().buildShortDateFromArguments(day: 12, month: Month.April, year: 2015), season: season5, number: 1, wikiURL:URL(string:"https://es.wikipedia.org/wiki/Las_guerras_venideras")!)
        _=Episode(title: "The House of Black and White", emissionDate:Date().buildShortDateFromArguments(day: 19, month: Month.April, year: 2015), season: season5, number: 2, wikiURL:URL(string:"https://es.wikipedia.org/wiki/La_Casa_de_Negro_y_Blanco")!)
        
        _=Episode(title: "The Red Woman", emissionDate:Date().buildShortDateFromArguments(day: 24, month: Month.April, year: 2016), season: season6, number: 1, wikiURL:URL(string:"https://es.wikipedia.org/wiki/La_mujer_roja")!)
        _=Episode(title: "Home", emissionDate:Date().buildShortDateFromArguments(day: 1, month: Month.May, year: 2016), season: season6, number: 2, wikiURL:URL(string:"https://es.wikipedia.org/wiki/A_casa")!)
        
        _=Episode(title: "Dragonstone", emissionDate:Date().buildShortDateFromArguments(day: 16, month: Month.July, year: 2017), season: season7, number: 1, wikiURL:URL(string:"https://es.wikipedia.org/wiki/Game_of_Thrones_(temporada_7)#Episodios")!)
        _=Episode(title: "Stormborn", emissionDate:Date().buildShortDateFromArguments(day: 23, month: Month.July, year: 2017), season: season7, number: 2, wikiURL:URL(string:"https://es.wikipedia.org/wiki/Game_of_Thrones_(temporada_7)#Episodios")!)
       
        
        return [season1,season2,season3,season4,season5,season6,season7].sorted()
            
        
    }
    
    //MARK: - ENUM PARA DAR SOLUCIÓN AL PUNTO 8
    enum Slogan:String{
        
        case WinterIsComing="Winter is coming"
        case HearMeRoar="Hear Me Roar!"
        case FireandBlood="Fire and Blood"
    }
    
 
    var houses: [House]{

        
        //SIGIL
        let starkSigil=Sigil(image: "Stark.png", description: "Lobo Huargo")
        let lannisterSigil=Sigil(image:"lannister.jpg", description: "Leon Rampante")
        let targaryenSigil=Sigil(image: "targaryenSmall.jpg", description: "Dragón tricefalo")
        let mormontSigil=Sigil(image: "Mormont.png" , description: "A black bear in a green wood")
        let tyrellSigil=Sigil(image:"Tyrell.png", description: "A golden rose, on a green field")
        let boltonSigil=Sigil(image: "Bolton.png", description: "A red flayed man on pink strewn")
        let baratheonSigil=Sigil(image: "Baratheon.png" , description: "A black crowned stag, on a gold field")
        let greyhjoySigil=Sigil(image:"Greyjoy.png" , description: "Sable, a kraken Or")
 
        //HOUSES
        let starkHouse = House(name:"Stark",sigil:starkSigil,words:"Winter is coming", url: URL(string:"https://awoiaf.westeros.org/index.php/House_Stark")!)
        let lannisterHouse = House(name:"Lannister",sigil:lannisterSigil,words:"Hear Me Roar!", url: URL(string:"https://awoiaf.westeros.org/index.php/House_Lannister")!)
        let targaryenHouse = House(name: "Targaryen", sigil: targaryenSigil, words: "Fire and Blood", url: URL(string:"https://awoiaf.westeros.org/index.php/House_Targaryen")!)
        let tyrellHouse = House(name: "Tyrell", sigil: tyrellSigil, words: "Growing Strong", url: URL(string:"https://awoiaf.westeros.org/index.php/House_Tyrell")!)
        let mormontHouse = House(name: "Mormont", sigil: mormontSigil, words: "Here We Stand", url: URL(string:"https://awoiaf.westeros.org/index.php/House_Mormont")!)
        let boltonHouse = House(name: "Bolton", sigil: boltonSigil, words: "Our Blades are Sharp", url: URL(string:"https://awoiaf.westeros.org/index.php/House_Bolton")!)
        let baratheonHouse = House(name: "Baratheon", sigil: baratheonSigil, words: "Ours is the Fury", url: URL(string:"https://awoiaf.westeros.org/index.php/House_Baratheon")!)
        let greyjoyHouse = House(name: "Greyjoy", sigil: greyhjoySigil, words: "We Do Not Sow", url: URL(string:"https://awoiaf.westeros.org/index.php/House_Greyjoy")!)
        
        //PERSONS
        _ = Person(name:"Tyrion",alias:"El Enano",house:lannisterHouse, personImage: "Tyrion.jpg", wikiURL:"https://es.wikipedia.org/wiki/Tyrion_Lannister")
        _ = Person(name:"Aria",house:starkHouse, personImage:"Arya.jpg" ,wikiURL: "https://es.wikipedia.org/wiki/Arya_Stark")
        _ = Person(name: "Robb", alias: "El Joven Lobo", house: starkHouse, personImage: "Robb.jpg",wikiURL: "https://es.wikipedia.org/wiki/Robb_Stark")
        _ = Person(name: "Cersei", house: lannisterHouse, personImage: "Cersei.jpg",wikiURL:"https://es.wikipedia.org/wiki/Cersei_Lannister")
        _ = Person(name: "Jaime", alias: "Mata reyes", house:lannisterHouse, personImage:"Jaime.jpg",wikiURL:"https://es.wikipedia.org/wiki/Jaime_Lannister")
        _ = Person(name: "Daenerys", alias: "Madre de dragones", house: targaryenHouse, personImage: "Daenerys.jpg",wikiURL: "https://es.wikipedia.org/wiki/Daenerys_Targaryen")
        _ = Person(name: "Theon", house: greyjoyHouse, personImage: "Theon_Greyjoy.jpg",wikiURL: "https://en.wikipedia.org/wiki/Theon_Greyjoy")
        _ = Person(name: "Ramsay", alias:"The Bastard of Bolton",house: boltonHouse, personImage: "Ramsay_Bolton.jpg",wikiURL: "https://en.wikipedia.org/wiki/Ramsay_Bolton")
        _ = Person(name: "Jorah", alias:"Jorah the Andal",house: mormontHouse, personImage: "Jorah_Mormon.png",wikiURL: "https://en.wikipedia.org/wiki/Jorah_Mormont")
        _ = Person(name: "Robert", alias:"The usurper",house: baratheonHouse, personImage: "Robert_Baratheon.jpg",wikiURL: "https://en.wikipedia.org/wiki/Robert_Baratheon")
        _ = Person(name: "Robert", alias:"The usurper",house: baratheonHouse, personImage: "Robert_Baratheon.jpg",wikiURL: "https://en.wikipedia.org/wiki/Robert_Baratheon")
         _ = Person(name: "Margaery", alias:"The Little Rose",house: tyrellHouse, personImage: "Margery_Tyrell.jpg",wikiURL: "https://en.wikipedia.org/wiki/Margaery_Tyrell")
        
        
        return [targaryenHouse, starkHouse,lannisterHouse,mormontHouse,tyrellHouse,boltonHouse,baratheonHouse,greyjoyHouse].sorted()
    }
    
    //MARK: PUNTO 8. Esta función, su implementación y llamada se efectua a traves de un snippet. La llamada está implementada en RepositoryTest

    func houseBySlogan(slogan:Slogan) -> House{
        let house=houses.filter{ $0.words.uppercased() == slogan.rawValue.uppercased()}.first
        return house!
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


