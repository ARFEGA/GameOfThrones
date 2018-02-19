//
//  season.swift
//  Westeros
//
//  Created by ARMANDO on 19/2/18.
//  Copyright © 2018 ARMANDO. All rights reserved.
//

import UIKit


typealias episodes = Set<episode>
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
