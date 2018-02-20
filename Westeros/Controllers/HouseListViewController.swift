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
protocol HouseListViewControllerDelegate:AnyObject{//AnyObject es lo mismp que class
    func houseListViewController(_ vc:HouseListViewController,didSelectHouse:House)
    
}



class HouseListViewController: UITableViewController {
    // MARK - Properties
    let model:[House]
    weak var delegate:HouseListViewControllerDelegate?  //Para que se suelte memoria correctamente
    
    
    
    //MARK: - Initialization
    init(model:[House])
    {
        self.model=model
        //Siempre llamar a super.init
        super.init(style: .grouped)
        title="Westeros"
    }
    //Obligatorio
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //mark: -Cycle life
    override func viewDidLoad() {
        super.viewDidLoad()
        let lastRow=UserDefaults.standard.integer(forKey: LAST_HOUSE)
        let indexPath=IndexPath(row:lastRow,section:0)
            tableView.selectRow(at: indexPath, animated: true, scrollPosition: .top)
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

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
        cell?.imageView?.image=houseActual.sigil.image
        cell?.textLabel?.text=houseActual.name
        
        return cell!
        
    }
        //MARK - TableViewDelegate
        //should, will, did  (orden de acciones)
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Que casa han pulsado
        let house=model[indexPath.row]
        //Crear un controlador de detalle de la casa
        //let houseDetailVC=HouseDetailViewController(model:house)
        //Hacer un push
        //navigationController?.pushViewController(houseDetailVC, animated: true)
        
        //Avisamos al delegado para que ejecute lo que sea
        delegate?.houseListViewController(self, didSelectHouse: house)
        
        //Otra manera distinta al delegado para enviar notifficaciones =>notificaciones
        //Pero es más indirecto que un delegate, ya que el delegate asocia los dos elementos asociados
        //Mejor siempre con delegate
        let notificationCenter=NotificationCenter.default
        let notification=Notification(name: Notification.Name(HOUSE_DID_CHANGE_NOTIFICATION_NAME), object: self,
                                      userInfo: [HOUSE_KEY:house])
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



    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    

