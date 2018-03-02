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
    var ViewsState:viewsState?
    var splitVC:UISplitViewController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        
        
        //guard let window=window else {
        //    return true
        //}
       
        splitVC=UISplitViewController()
        let pruebajson = myJson()
        pruebajson.leeJson()
        
        
       
        
        //MARK:- CREATE_DATA
        let arraySeasons=Repository.local.seasons
        let houses=Repository.local.houses
        //let arrayEpisodes=arraySeasons[0].sortedEpisodes
        
        
        
        //MARK: - CREATE_VC
        let houseListVC=HouseListViewController(model:houses)
        let lastSelectedHouse=houseListVC.lastSelectedHouse()
        let houseDetailVC=HouseDetailViewController(model:lastSelectedHouse)
        let seasonListVC=SeasonListViewController(model: arraySeasons)
        let seasonDetailVC=SeasonDetailVC(detailSeason: arraySeasons.first!)
        //let _episodesListVC=episodesListVC(arrayEpisodes: arrayEpisodes)
       
        
        
        //MARK: - CREATE UITabBarController
        let tabBarVC = UITabBarController()
        tabBarVC.viewControllers=[houseListVC.wrappedInNavigation(),seasonListVC.wrappedInNavigation()]
        
        
        
        //MARK: - STRUCT ViewsState
        let VCs:[UIViewController]=[houseDetailVC,seasonDetailVC]
        ViewsState = viewsState(
            primaryViewSplit: tabBarVC,
            secondaryViewSplit: seasonDetailVC.wrappedInNavigation(),
            auxViewSplit: houseDetailVC.wrappedInNavigation(),
            VCs: VCs ,
            clickedButtonBarTab: 0)
       
        //MARK: - CREATE split
        
        //splitVC=splitVController(primaryVC: ViewsState?.primaryViewSplit, secondaryVC:ViewsState?.secondaryViewSplit)
        
        //MARK: - DELEGATES ASIGNED
        houseListVC.delegate=houseDetailVC
        seasonListVC.delegate=seasonDetailVC
       
        
        tabBarVC.delegate = self
        splitVC?.delegate=self
        splitVC?.viewControllers=[tabBarVC,houseDetailVC.wrappedInNavigation()]
        splitVC?.preferredDisplayMode = .allVisible
       
        //let NCSplitVC = splitVC?.viewControllers[(splitVC?.viewControllers.count)!-1] as! UINavigationController
        //NCSplitVC.navigationItem.leftBarButtonItem=splitVC?.displayModeButtonItem
        //splitVC?.navigationController?.navigationItem.leftBarButtonItem=splitVC?.displayModeButtonItem
        window=UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = splitVC
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
    
    func targetDisplayModeForAction(in svc: UISplitViewController) -> UISplitViewControllerDisplayMode {
        return (splitVC?.displayMode)!
    }
    
//    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
//        return false
//    }
  
    func splitViewController(_ splitViewController: UISplitViewController, separateSecondaryFrom primaryViewController: UIViewController) -> UIViewController? {

        let index=(ViewsState?.clickedButtonBarTab)!
        //splitVC?.preferredDisplayMode = .allVisible
        return ViewsState?.VCs[index].wrappedInNavigation()
    }

    func primaryViewController(forCollapsing splitViewController: UISplitViewController) -> UIViewController? {
        //splitVC?.preferredDisplayMode = .primaryHidden
        return ViewsState?.primaryViewSplit
    }
    func primaryViewController(forExpanding splitViewController: UISplitViewController) -> UIViewController? {
        splitVC?.preferredDisplayMode = .allVisible
        return ViewsState?.primaryViewSplit
    }
   
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        ViewsState?.clickedButtonBarTab = tabBarController.selectedIndex
        switch UIApplication.shared.statusBarOrientation {
        //En estado PORTRAIT
        case .portrait,.portraitUpsideDown:
            //splitVC?.preferredDisplayMode = .primaryHidden
            break
         //En estado LANDSCAPE
        case .landscapeLeft,.landscapeRight:
            //splitVC?.preferredDisplayMode = .allVisible
            break
        case .unknown:
            break
        }
        splitVC?.showDetailViewController( (ViewsState?.VCs[tabBarController.selectedIndex].wrappedInNavigation())!, sender:self)
       
        
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

