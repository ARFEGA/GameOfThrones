//
//  leeJson.swift
//  Westeros
//
//  Created by ARMANDO on 2/3/18.
//  Copyright © 2018 ARMANDO. All rights reserved.
//

import Foundation


struct HousesJson : Decodable {
    let houses:[HouseJson]
}


struct HouseJson: Decodable{
    let name:String
    let wikiSuffix:String
    let people:[PeopleJson]
}

struct PeopleJson: Decodable{
    let name:String
    let description:String
    let imageSuffix:String
    let wikiSuffix:String
   
}









final class myJson:Decodable{
    
    func leeJson() {
        
       //let url="/Users/ARMANDO/Desktop/BOOTCAMP_MOBILE/Swift/IOS SWIFT/Westeros/Westeros/DATA/HOUSES.JSON"
       // let json = try! String(contentsOf:URL(string:url)!)
        guard let path = Bundle.main.path(forResource: "HOUSES", ofType: "JSON") else{return}
        guard let data=NSData(contentsOfFile:path) else{return}
        let decoder = JSONDecoder()
        
        let houses = try! decoder.decode(HousesJson.self, from: data as Data)
        print(houses)
       
        
        
    }

//    func leeJson() -> Data{
//        if let ruta = Bundle.main.path(forResource: "MOCK_DATA", ofType: "json"),
//            let datosJSON = FileManager.default.contents(atPath: ruta),
//            let datos = try? JSONSerialization.jsonObject(with: datosJSON, options: .mutableContainers) as? [[String:Any]] {
//            let jsonData = datos.data(encoding: .utf8)!
//            let decoder = JSONDecoder()
//            let beer = try! decoder.decode(Beer.self, for: jsonData)
//        }
    
//        if JSONSerialization.isValidJSONObject(datos) {
//            do {
//                let JSONData = try JSONSerialization.data(withJSONObject: datos, options: .prettyPrinted)
//                let docDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
//                let fileURL = docDirectory.appendingPathComponent("MOCK_DATA").appendingPathExtension("json")
//                try JSONData.write(to: fileURL)
//            } catch {
//                print("Error en la grabación \(error.localizedDescription)")
//            }
//        } else {
//            print("Datos no válidos")
//        }
//    }
}
