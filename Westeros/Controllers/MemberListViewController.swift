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
    let model:[Person]
    
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
        tableView.delegate = self
        tableView.dataSource = self
        
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
}
    
    extension MemberListViewController:UITableViewDelegate{
        
    }
    
    
    
    
    
    

