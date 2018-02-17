//
//  PersonsListViewController.swift
//  Westeros
//
//  Created by ARMANDO on 16/2/18.
//  Copyright © 2018 ARMANDO. All rights reserved.
//

import UIKit

class PersonsListViewController: UITableViewController {
        
    // MARK: - PROPERTIES
    let Persons:[Person]
    
    //MARK: INITIALIZERS
    init(persons:[Person]){
        self.Persons=persons
        super.init(style: .grouped)
        title="House Members"
    }
    //Necesário
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

  
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
      
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Persons.count
    }

    //Método para configurar una celda concreta
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Identificador de celda
        let IdCell="HouseMember"
        //Obtener el personaje actual
        let actualPerson=Persons[indexPath.row]
        //Crear celda pero preguntando antes si hay alguna en cache
        var cell=tableView.dequeueReusableCell(withIdentifier: IdCell)
        if cell==nil{
            cell=UITableViewCell(style: .default, reuseIdentifier: IdCell)
        }
        //Sincronizo inf modelo con celda
        
        cell?.imageView?.image=actualPerson.personImage
        cell?.textLabel?.text=actualPerson.fullName
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Que casa han pulsado
        let person=Persons[indexPath.row]
        //Crear un controlador de detalle de la casa
        let WikiViewVC=WikiViewController(model:person)
        //Hacer un push
        navigationController?.pushViewController(WikiViewVC, animated: true)
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
