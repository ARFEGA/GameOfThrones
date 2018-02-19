//
//  season.swift
//  Westeros
//
//  Created by ARMANDO on 19/2/18.
//  Copyright © 2018 ARMANDO. All rights reserved.
//

import UIKit


typealias episodes = Set<Episode>
final class Season{
    let number:Int
    let name:String
    let emissionDate:Date
    private var _empisodes:episodes
    
    init(number:Int,name:String,date:Date){
        self.number=number
        self.name=name
        self.emissionDate=date
        _empisodes=episodes()
    }
}

extension Season{
    var proxyForEquatable:String{
        return "\(number)\(name)\(emissionDate)"
    }
    var proxyForComparision:String{
        return name.uppercased()
    }
}

extension Season:Hashable{
    var hashValue:Int{
        return proxyForEquatable.hashValue
    }
}

extension Season:Equatable{
    static func ==(lhs: Season, rhs: Season) -> Bool {
        return lhs.proxyForEquatable == rhs.proxyForEquatable
    }
}

//MARK: - Comparable
extension Season:Comparable{
    static func <(lhs: Season, rhs: Season) -> Bool {
        return lhs.proxyForComparision < rhs.proxyForComparision
    }
}
