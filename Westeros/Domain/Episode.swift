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
    weak var season:Season?
    init(title:String,emissionDate:Date,season:Season) {
        self.title=title
        self.emissionDate=emissionDate
        self.season=season
    }
}

extension Episode:CustomStringConvertible{
    var description: String {
        return "Clase mediante la que se intancia cada episodio"
    }
}


extension Episode{
    var proxyForEquatable:String{
        return "\(title)\(emissionDate)\(season!.number)"
    }
    var proxyForComparision:String{
        return title.uppercased()
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
