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
    let model:House
    
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
        
        // Do any additional setup after loading the view.
        
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
        //Creamos botones
        let wikiButton=UIBarButtonItem(title: "Wiki", style: .plain, target: self, action:#selector(displayWiki))
        let PersonsHouse=UIBarButtonItem(title: "Members", style: .plain, target: self, action: #selector(displayPersons))
        //Añadimos los botones creados
        navigationItem.rightBarButtonItems=[wikiButton,PersonsHouse]
        
    }
    //Func asignada a botones
    @objc func displayWiki(){
        //Creamos el wikiVC
        let wikiVC=WikiViewController(model: model)
        navigationController?.pushViewController(wikiVC, animated: true)
    }
    @objc func displayPersons(){
        //Creamos el controlador y hacemos un push
        let PersonVC=PersonsListViewController(persons: model.SortedPersons)
        navigationController?.pushViewController(PersonVC, animated: true)
    }
    
    
    
    
    
    
    //Recibe avisos de utilización excesiva de memoria. Debemos liberar, pues el sistema mata la app
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
