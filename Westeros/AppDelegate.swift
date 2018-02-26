//
//  AppDelegate.swift
//  Westeros
//
//  Created by ARMANDO on 8/2/18.
//  Copyright © 2018 ARMANDO. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,UITabBarControllerDelegate,UISplitViewControllerDelegate {

    var window: UIWindow?
    //var splitVC: splitVController?
    var ViewsState:viewsState?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        //guard let window=window else {
        //    return true
        //}
       
        let splitVC=UISplitViewController()
        
        
       
        
        //MARK:- CREATE_DATA
        let arraySeasons=Repository.local.seasons
        let houses=Repository.local.houses
        let arrayEpisodes=arraySeasons[0].sortedEpisodes
        
        
        
        //MARK: - CREATE_VC
        let houseListVC=HouseListViewController(model:houses)
        let lastSelectedHouse=houseListVC.lastSelectedHouse()
        let houseDetailVC=HouseDetailViewController(model:lastSelectedHouse)
        let _episodesListVC=episodesListVC(arrayEpisodes: arrayEpisodes)
        let seasonListVC=SeasonListViewController(model: arraySeasons)
        
        
        //MARK: - CREATE UITabBarController
        let tabBarVC = UITabBarController()
        tabBarVC.viewControllers=[seasonListVC.wrappedInNavigation(),houseListVC.wrappedInNavigation()]
        
        
        
        //MARK: - STRUCT ViewsState
        let VCs:[UIViewController]=[_episodesListVC,houseDetailVC]
        ViewsState = viewsState(
            primaryViewSplit: tabBarVC,
            secondaryViewSplit: _episodesListVC.wrappedInNavigation(),
            auxViewSplit: houseDetailVC.wrappedInNavigation(),
            VCs: VCs ,
            clickedButtonBarTab: 0)
       
        //MARK: - CREATE split
        
        //splitVC=splitVController(primaryVC: ViewsState?.primaryViewSplit, secondaryVC:ViewsState?.secondaryViewSplit)
        
        //MARK: - DELEGATES ASIGNED
        houseListVC.delegate=houseDetailVC
        seasonListVC.delegate=_episodesListVC
        tabBarVC.delegate = self
        splitVC.delegate=self
        splitVC.viewControllers=[tabBarVC]
        
        
        window=UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = tabBarVC
        return true
        //let navigationController = splitVC!.viewControllers[splitVC!.viewControllers.count-1] as! UINavigationController
        //navigationController.topViewController!.navigationItem.leftBarButtonItem = splitVC!.displayModeButtonItem()
        //tabBarViewController.viewControllers    = [starkHouseVC.wrappedInNavigation(),lannisterHouseVC.wrappedInNavigation()
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
       
        
        
    }
    
    
  
    func splitViewController(_ splitViewController: UISplitViewController, separateSecondaryFrom primaryViewController: UIViewController) -> UIViewController? {

        let index=(ViewsState?.clickedButtonBarTab)!

        return ViewsState?.VCs[index].wrappedInNavigation()
    }

    func primaryViewController(forCollapsing splitViewController: UISplitViewController) -> UIViewController? {
        return ViewsState?.primaryViewSplit
    }
    func primaryViewController(forExpanding splitViewController: UISplitViewController) -> UIViewController? {
        return ViewsState?.primaryViewSplit
    }
   
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        ViewsState?.clickedButtonBarTab = tabBarController.selectedIndex
        switch UIApplication.shared.statusBarOrientation {
        //En estado PORTRAIT
        case .portrait,.portraitUpsideDown:
            break
         //En estado LANDSCAPE
        case .landscapeLeft,.landscapeRight:
            //splitVC?.showDetailViewController( (ViewsState?.VCs[tabBarController.selectedIndex].wrappedInNavigation())!, sender:self)
            break
        case .unknown:
            break
        }
       
        
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

