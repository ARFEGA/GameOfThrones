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
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        
    }
    // Mark: - Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
        syncModelWithView()
    }
    
    // Mark: - Sync
    func syncModelWithView() {
        // Model -> View
        houseNameLabel.text = "House \(model.name)"
        sigilImageView.image = UIImage(named:model.sigil.image)
        wordsLabel.text = model.words
        title=model.name
        
    }
  
    // MARK - UI  (Create button)
    func setupUI(){
        let wikiButton=UIBarButtonItem(title: "Wiki", style: .plain, target: self, action:#selector(displayWiki))
        let members=UIBarButtonItem(title: "Members", style: .plain, target: self, action:#selector(displayMembers))
        [wikiButton,members].forEach({ (button:UIBarButtonItem) in
            button.tintColor=UIColor(red:0.20, green:0.20, blue:0.00, alpha:1.0)
            })
        navigationItem.rightBarButtonItems = [wikiButton,members]
        
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
        syncModelWithView()
        
        //Sin funcionalidad, las mil y una pruebas para conseguir que funcionase en portrait
        switch UIApplication.shared.statusBarOrientation {
            //En estado PORTRAIT
            case .portrait,.portraitUpsideDown:
                //let aVariable = appDelegate.value
                //let vc = (appDelegate.ViewsState?.VCs[1].wrappedInNavigation())!
                //appDelegate.splitVC?.collapseSecondaryViewController(vc, for: appDelegate.splitVC!)
                
                
                break
            //En estado LANDSCAPE
            case .landscapeLeft,.landscapeRight:
                
                //let aVariable = appDelegate.value
                //appDelegate.splitVC?.show((appDelegate.ViewsState?.secondaryViewSplit).wrappedInNavigation(), sender: self)
                break
            case .unknown:
                break
        }
        
        
    }
}


