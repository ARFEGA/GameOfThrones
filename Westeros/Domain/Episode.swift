//
//  Episode.swift
//  Westeros
//
//  Created by ARMANDO on 19/2/18.
//  Copyright © 2018 ARMANDO. All rights reserved.
//

import UIKit
final class Episode{
    let title:String
    let emissionDate:Date
    let number:Int
    weak var season:Season?
    let wikiURL:URL
    init(title:String,emissionDate:Date,season:Season,number:Int,wikiURL:URL) {
        self.title=title
        self.emissionDate=emissionDate
        self.season=season
        self.number=number
        self.wikiURL=wikiURL
        season.add(episodes: self)
    }
}

extension Episode:CustomStringConvertible{
    var description: String {
        return "Clase mediante la que se intancia cada episodio"
    }
}


extension Episode{
    var proxyForEquatable:String{
        return "\(number)\(title)\(emissionDate)\(season!.number)"
    }
    var proxyForComparision:Int{
        return number
    }
}

extension Episode:Hashable{
    var hashValue:Int{
        return proxyForEquatable.hashValue
    }
}

extension Episode:Equatable{
    static func ==(lhs: Episode, rhs: Episode) -> Bool {
        return lhs.proxyForEquatable == rhs.proxyForEquatable
    }
}

//MARK: - Comparable
extension Episode:Comparable{
    static func <(lhs: Episode, rhs: Episode) -> Bool {
        return lhs.proxyForComparision < rhs.proxyForComparision
    }
}
