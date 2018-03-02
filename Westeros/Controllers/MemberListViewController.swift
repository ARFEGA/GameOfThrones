//
//  MemberListViewController.swift
//  Westeros
//
//  Created by ARMANDO on 19/2/18.
//  Copyright © 2018 ARMANDO. All rights reserved.
//

import UIKit

class MemberListViewController: UIViewController {

    // MARK: - OUTLES
    @IBOutlet weak var tableView: UITableView!
    // MARK: - PROPERTIES
    var PersonsModel:[Person]
    // MARK: - INITIALIZATION
    init(model:[Person]){
        self.PersonsModel=model
        super.init(nibName:nil,bundle:nil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: -Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
       
        //Alta en notificaciones
        let notificationCenter=NotificationCenter.default
        //notificationCenter.addObserver(self, selector: #selector(houseDidChange), name: Notification.Name(rawValue: HOUSE_DID_CHANGE_NOTIFICATION_NAME), object: nil)
        notificationCenter.addObserver(forName: Notification.Name(rawValue: HOUSE_DID_CHANGE_NOTIFICATION_NAME), object: nil, queue: OperationQueue.main) { (notification) in
            // userInfo is the payload send by sender of notification
            if let userInfo = notification.userInfo {
                // Safely unwrap the name sent out by the notification sender
                let house = userInfo[HOUSE_KEY] as! House
                self.PersonsModel = house.sortedMembers
                self.tableView.reloadData()
                self.title=house.name
                let backItem = UIBarButtonItem()
                backItem.title = self.title
                self.navigationItem.backBarButtonItem = backItem
                
            }
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //Baja en notificaciones . Otra posibilidad es en el deInit() <= buscar en internet
        NotificationCenter.default.removeObserver(self)
        //NotificationCenter.default.removeObserver(self, name: Notification.Name(HOUSE_DID_CHANGE_NOTIFICATION_NAME), object: nil)
        
    }
    
//    @objc func houseDidChange(notification: Notification) {
//        // userInfo is the payload send by sender of notification
//        if let userInfo = notification.userInfo {
//            // Safely unwrap the name sent out by the notification sender
//            let house = userInfo[HOUSE_KEY] as! House
//            self.PersonsModel = house.sortedMembers
//            tableView.dataSource = self
//        }
//    }
}


// MARK: - UITableViewDataSource
extension MemberListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PersonsModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "HouseMember"
        
        // Descubrir la persona que tenemos que mostrar
        let selectedPerson = PersonsModel[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId)
            ?? UITableViewCell(style: .default, reuseIdentifier: cellId)
        
        // Sicronizar celda y persona
        cell.textLabel?.text = selectedPerson.fullName
        cell.imageView?.image=selectedPerson.personImage
        
        // Devolver la celda
        return cell
    }
}
extension MemberListViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Que casa han pulsado
        let person=PersonsModel[indexPath.row]
        //Crear un controlador de detalle de la casa
        let WikiViewVC=WikiViewController(model:person)
        //Hacer un push
        navigationController?.pushViewController(WikiViewVC, animated: true)
    }
  
}

    
    
    
    

    

    
    
    
    
    
    

