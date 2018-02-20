//
//  UIViewController+Additions.swift
//  Westeros
//
//  Created by ARMANDO on 13/2/18.
//  Copyright © 2018 ARMANDO. All rights reserved.
//

import UIKit

extension UIViewController{
    func wrappedInNavigation()->UINavigationController{
            return UINavigationController(rootViewController: self)
    }
}

extension String{
    func getDateFromString() -> Date{
        let stringFormat=DateFormatter()
        stringFormat.dateFormat="dd/MM/yyyy"
        return stringFormat.date(from:self)!
    }
}
enum Month:Int{
    case January=1,February,March,April,May,June,July,August,September,October,Novembrer,December
    
}
extension Date{
    func buildShortDateFromArguments(day:Int,month:Month,year:Int) -> Date{
        var firstDateComponents = DateComponents()
        firstDateComponents.day = day
        firstDateComponents.month = month.rawValue
        firstDateComponents.year = year
        firstDateComponents.timeZone = TimeZone(abbreviation: "UTC")
        return  Calendar(identifier: Calendar.Identifier.gregorian).date(from: firstDateComponents)!
    }
    
}
