//
//  HouseJson.swift
//  Westeros
//
//  Created by ARMANDO on 2/3/18.
//  Copyright © 2018 ARMANDO. All rights reserved.
//

import UIKit

//Con set, alamacenamos elementos y no permite que estén duplicados a dierencia de un array
//typealias Members2 = Set<Person>

final class houseJson:Decodable {
    let name:String
    let sigil1:String
    let words:String
    let wikiURL:String
    let sigil2:Sigil2
    //let person:[String]
    
    //private var _members: Members2
    
//    init(name:String,sigil:String,words:String,url:String,person:[String]){
//        self.name=name
//        self.sigil=sigil
//        self.words=words
//        self.wikiURL=url
//        //self.person=person
//       // _members=Members2()
//    }
    
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        latitude = try values.decode(Double.self, forKey: .latitude)
//        longitude = try values.decode(Double.self, forKey: .longitude)
//
//        let additionalInfo = try values.nestedContainer(keyedBy: AdditionalInfoKeys.self, forKey: .additionalInfo)
//        elevation = try additionalInfo.decode(Double.self, forKey: .elevation)
    
    private enum CodingKeys: String, CodingKey {
        typealias RawValue = Sigil
        
            case name
            case sigil1
            case words
            case wikiURL
            case sigil2(RawValue)
            
        }
        private enum Sigil:String,CodingKey{
            case description
            case image
        }

        required init(from decoder : Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            self.name = try values.decode(String.self, forKey: .name)
            
            self.sigil=try values.decode(String.self, forKey: .sigil)
            self.words = try values.decode(String.self, forKey: .words)
            self.wikiURL=try values.decode(String.self, forKey: .wikiURL)//_members=Members()
        }

}
final class Sigil2{
    let description: String
    let image:String
    
    init(image:String,description:String) {
        self.image=image
        self.description=description
}
}
