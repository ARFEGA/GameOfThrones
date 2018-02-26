//
//  HouseDetailViewController.swift
//  Westeros
//
//  Created by ARMANDO on 12/2/18.
//  Copyright © 2018 ARMANDO. All rights reserved.
//

import UIKit



class HouseDetailViewController: UIViewController {
    
    // MARK: - OUTLET
    
    @IBOutlet weak var houseNameLabel: UILabel!
    @IBOutlet weak var sigilImageView: UIImageView!
    @IBOutlet weak var wordsLabel: UILabel!
    
    //Mark: - Properties
    var model:House
    
    //Mark: - Initialization de la clase HouseDetailViewController
    init(model:House){
        self.model=model
        
        super.init(nibName:nil,bundle:Bundle(for: type(of:self)))
        //Conseguimos que se cargue el titulo de el resto de pestañas (tabBar) aunque no esté pintadas
        self.title=model.name
    }
    //Algo necesário sin más información
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Conrola el ciclo de vida de un objeto. Que es desde que se crea el objeto hasta que muere
    override func viewDidLoad() {
        super.viewDidLoad()
        syncModelWithView()
    }
    
    //MARK: - Sync
    func syncModelWithView(){
        houseNameLabel.text="House \(model.name)"
        sigilImageView.image=model.sigil.image
        wordsLabel.text=model.words
        self.title=model.name
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
        syncModelWithView()
    }
    // MARK - UI  (Create button)
    func setupUI(){
        let wikiButton=UIBarButtonItem(title: "Wiki", style: .plain, target: self, action:#selector(displayWiki))
        let members=UIBarButtonItem(title: "Members", style: .plain, target: self, action:#selector(displayMembers))
       
        navigationItem.rightBarButtonItems=[wikiButton,members]
    }
    
    @objc func displayWiki(){
        //Creamos el wikiVC
        let wikiVC=WikiViewController(model: model)
        navigationController?.pushViewController(wikiVC, animated: true)
    }
    @objc func displayMembers(){
        //Creamos el wikiVC
        let membersVC=MemberListViewController(model: model.sortedMembers)
        navigationController?.pushViewController(membersVC, animated: true)
    }
   
    

}
extension HouseDetailViewController:HouseListViewControllerDelegate{
    func funcDelegateHouseListViewController(_ vc: HouseListViewController, didSelectHouse house: House) {
        self.model=house
        
        switch UIApplication.shared.statusBarOrientation {
            //En estado PORTRAIT
            case .portrait,.portraitUpsideDown:
                //let aVariable = appDelegate.value
                //let vc = (appDelegate.ViewsState?.VCs[1].wrappedInNavigation())!
                //appDelegate.splitVC?.collapseSecondaryViewController(vc, for: appDelegate.splitVC!)
                
                
                break
            //En estado LANDSCAPE
            case .landscapeLeft,.landscapeRight:
                syncModelWithView()
                //let aVariable = appDelegate.value
                //appDelegate.splitVC?.show((appDelegate.ViewsState?.secondaryViewSplit).wrappedInNavigation(), sender: self)
                break
            case .unknown:
                break
        }
        
        
    }
}


