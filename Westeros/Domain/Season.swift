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
    let image:UIImage
    let plot:String
    private var _episodes:episodes
    
    init(number:Int,name:String,date:Date,image:UIImage,plot:String){
        self.number=number
        self.name=name
        self.emissionDate=date
        self.image=image
        self.plot=plot
        _episodes=episodes()
    }
}

extension Season{
    func add(episode:Episode){
       _episodes.insert(episode)
    }
    func add(episodes:Episode...){
        episodes.forEach{_episodes.insert($0)}
    }
    var sortedEpisodes:[Episode]{
        return _episodes.sorted()
    }
    var count:Int{
        return _episodes.count
    }
}



extension Season : CustomStringConvertible{
    var description: String {
        return "Clase mediante la que se intancia cada temporada"
    }
}

extension Season{
    var proxyForEquatable:String{
        return "\(number)\(name)\(emissionDate)"
    }
    var proxyForComparision:Int{
        return number
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
