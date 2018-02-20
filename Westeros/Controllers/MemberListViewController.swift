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
    var model:[Person]
    
    // MARK: - INITIALIZATION
    
    init(model:[Person]){
        self.model=model
        super.init(nibName:nil,bundle:nil)
        title="Members"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    // MARK: -Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //Alta en notificaciones
        let notificationCenter=NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(houseDidChange(notification:)), name: NSNotification.Name(rawValue: HOUSE_DID_CHANGE_NOTIFICATION_NAME), object: nil)
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //Baja en notificaciones . Otra posibilidad es en el deInit() <= buscar en internet
        NotificationCenter.default.removeObserver(self)
        //NotificationCenter.default.removeObserver(self, name: Notification.Name(HOUSE_DID_CHANGE_NOTIFICATION_NAME), object: nil)
        
    }
    
    @objc func houseDidChange(notification: Notification) {
        // userInfo is the payload send by sender of notification
        if let userInfo = notification.userInfo {
            // Safely unwrap the name sent out by the notification sender
            let house = userInfo[HOUSE_KEY] as! House
            self.model = house.sortedMembers
            tableView.dataSource = self
        }
    }
}


// MARK: - UITableViewDataSource
extension MemberListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "MemberCell"
        
        // Descubrir la persona que tenemos que mostrar
        let person = model[indexPath.row]
        
        // Preguntar por una celda (a una cache) o Crearla
        //        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        //        if cell == nil {
        //            cell = UITableViewCell(style: .default, reuseIdentifier: cellId)
        //        }
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId)
            ?? UITableViewCell(style: .default, reuseIdentifier: cellId)
        
        // Sicronizar celda y persona
        cell.textLabel?.text = person.fullName
        
        // Devolver la celda
        return cell
    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        //Que casa han pulsado
//        let person=Persons[indexPath.row]
//        //Crear un controlador de detalle de la casa
//        let WikiViewVC=WikiViewController(model:person)
//        //Hacer un push
//        navigationController?.pushViewController(WikiViewVC, animated: true)
//    }
    
    
    
}
    

    
    
    
    
    
    

