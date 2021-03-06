//
//  HouseListViewController.swift
//  Westeros
//
//  Created by ARMANDO on 15/2/18.
//  Copyright © 2018 ARMANDO. All rights reserved.
//

import UIKit


let HOUSE_DID_CHANGE_NOTIFICATION_NAME="HouseDidChange"
let HOUSE_KEY="HouseKey"
let LAST_HOUSE="Last_House"
//AnyObject es lo mismp que class. Es necesaro que herede así para pode hacer una referencia weak
protocol HouseListViewControllerDelegate:AnyObject{
    func funcDelegateHouseListViewController(_ vc:HouseListViewController,didSelectHouse:House)
    
}



class HouseListViewController: UITableViewController {
    // MARK - Properties
    let model:[House]
    weak var delegate:HouseListViewControllerDelegate?  //weak Para que se suelte memoria correctamente
    
    
    //MARK: - Initialization
    init(model:[House])
    {
        self.model=model
        //Siempre llamar a super.init
        super.init(style: .grouped)
        title="HOUSES"
    }
    //Obligatorio
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //mark: -Cycle life
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor=UIColor(red:0.20, green:0.20, blue:0.00, alpha:1.0)
        let lastRow=UserDefaults.standard.integer(forKey: LAST_HOUSE)
        let indexPath=IndexPath(row:lastRow,section:0)
        tableView.selectRow(at: indexPath, animated: true, scrollPosition:.top)
    }
    
    // MARK: - Table view data source
   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return model.count
    }

  //Método para configurar una celda concreta
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       //Identificador de celda
        let cellId="HouseCell"
        //Necesitamos la casa
        let houseActual=model[indexPath.row]
        
        //Crear la celda, preguntando si la hay en cache
        var cell=tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell==nil{
            cell=UITableViewCell(style: .default, reuseIdentifier: cellId)
        }
        //Sincronizar modelo (house) con la celda (vista)
        cell?.imageView?.image = UIImage(named: (houseActual.sigil.image))
        cell?.textLabel?.text=houseActual.name
        
        return cell!
        
    }
        //MARK - TableViewDelegate
        //should, will, did  (orden de acciones)
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Que casa han pulsado
        let house=model[indexPath.row]
        delegate?.funcDelegateHouseListViewController(self, didSelectHouse: house)

        //Otra manera distinta al delegado para enviar notifficaciones =>notificaciones
        //Pero es más indirecto que un delegate, ya que el delegate asocia los dos elementos asociados
        //Mejor siempre con delegate
        let notificationCenter=NotificationCenter.default
        let notification=Notification(name: Notification.Name(HOUSE_DID_CHANGE_NOTIFICATION_NAME), object: self,userInfo: [HOUSE_KEY:house])
        notificationCenter.post(notification)
        //Persistencia-> Guardar las coordenadas de la UITableView (section y row seleccionadas)
        saveLastSelectedHouse(at:indexPath.row)
    }
    
    
}
extension HouseListViewController{
    func saveLastSelectedHouse(at row:Int){
        let defaults=UserDefaults.standard
        defaults.set(row, forKey: LAST_HOUSE)
        //Por si las moscas, asegurar que se guarde si o si
        defaults.synchronize()
    }

    func lastSelectedHouse()->House{
        //Extraer el row de userDefaults
        let row=UserDefaults.standard.integer(forKey: LAST_HOUSE)
        //Obtener la casa de ese row
        let house=model[row]
        //Mostra
        return house
    }

}


    

