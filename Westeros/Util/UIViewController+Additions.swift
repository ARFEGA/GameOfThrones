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

//extension Notification.Name{
//    enum Notificaciones:String{
//        case HOUSE_DID_CHANGE_NOTIFICATION_NAME="houseDidChange"
//        case SEASON_DID_CHANGE_NOTIFICATION_NAME="SeasonDidChange"
//    }
//}

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
        return   Calendar(identifier: Calendar.Identifier.gregorian).date(from: firstDateComponents)!
    }
    func dateToString() ->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: "es_ES")
        return dateFormatter.string(from: self)
    }
    
}

enum diaMes:Int{
    //case January,February,March,April,May,June,July,August,September,October,Novembrer,December
    case February=1,April,June
    var range: CountableClosedRange<Int> {
        switch self {
        case .February:     return 0...28
        case .April:        return 0...30
        case .June:         return 0...30
        }
    }
    func dia(auxDia:Int) -> Int? {
        let aux:Int?=nil
        switch (auxDia) {
        case diaMes.April.range:    return auxDia
        case diaMes.February.range: return auxDia
        case diaMes.June.range:     return auxDia
        default:
            return aux
        }
    }
}

struct viewsState{
    
    var primaryViewSplit:UITabBarController
    var secondaryViewSplit:UINavigationController
    var auxViewSplit:UINavigationController
    var VCs:[UIViewController]
    var clickedButtonBarTab:Int
    
}











