//
//  AppDelegate.swift
//  Westeros
//
//  Created by ARMANDO on 8/2/18.
//  Copyright © 2018 ARMANDO. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        //guard let window=window else {
        //    return true
        //}
        window=UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.blue
        window?.makeKeyAndVisible()
        
        //Creamos un modelo
        let houses=Repository.local.houses
        
        //Creamos los controladores
        let houseListVC=HouseListViewController(model:houses)
        let houseDetailVC=HouseDetailViewController(model:houses.first!)//Solo muestra el primer elemento
        
        //Asignamos delegados
        houseListVC.delegate=houseDetailVC
        
        //Crear el split
        let splitVC=UISplitViewController()
        splitVC.viewControllers=[houseListVC.wrappedInNavigation(),houseDetailVC.wrappedInNavigation()]
        
        //VC de la tabla
        //let housesListVC=HouseListViewController(model: houses)
        
        //Asignamos el VC a root de la ventana y metemos la tabla en un navigation
        //window?.rootViewController = housesListVC.wrappedInNavigation()
        
        window?.rootViewController = splitVC
        
        return true
        
        
        
        
        
        //        let tabBarViewController=UITabBarController()
        //        tabBarViewController.viewControllers =
        //            houses
        //            .map{ HouseDetailViewController(model:$0) }
        //            .map{ $0.wrappedInNavigation() }
        
        // Crea los controladores
        //let controllers=houses.map{house in
        //    return HouseDetailViewController(model:house).wrappedInNavigation()
        //}
        //var controllers=[UIViewController]()
        //for house in houses{
        //    controllers.append(HouseDetailViewController(model:house).wrappedInNavigation())
        //}
        
        //Crear unos modelos
        //let starkSigil=Sigil(image:UIImage(named:"codeIsComing.png")!,description:"Lobo Huargo")
        //let starkHouse=House(name: "Stark", sigil: starkSigil, words: "Se acerca el invierno")
        //let lannisterSigil=Sigil(image:UIImage(named:"lannister.jpg")!,description:"Leon Rampante")
        //let lannisterHouse=House(name: "Lannister", sigil: lannisterSigil, words: "Oye mi rugido")
        
        //Crear los controladores
        //let starkHouseVC=HouseDetailViewController(model: starkHouse)
        //let lannisterHouseVC=HouseDetailViewController(model: lannisterHouse)
        //var navigationsControllers=[UINavigationController]()
        //for controller in controllers{
        //    navigationsControllers.append(controller.wrappedInNavigation())
        //}
        
        //Creamos los navigations
        //let starkNavigationController=UINavigationController(rootViewController: starkHouseVC)
        //let lannisterNavigationController=UINavigationController(rootViewController: lannisterHouseVC)
        
        //Creamos los combinadores
        
        //Los objetos entre corchetes, llamana a la función wrappedInNavigation (función creada en Extension creada por nosotros en UIKitExtensions), que devuelve el VC embuelto en un navigation controler.
        //tabBarViewController.viewControllers    = [starkHouseVC.wrappedInNavigation(),lannisterHouseVC.wrappedInNavigation()]
        //tabBarViewController.viewControllers    = [starkNavigationController,lannisterNavigationController]
        
        
        
        
        //Asignamos el rootVC
        //window?.rootViewController=tabBarViewController
       
        
        
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

