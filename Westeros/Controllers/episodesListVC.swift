//
//  episodesListVC.swift
//  Westeros
//
//  Created by ARMANDO on 23/2/18.
//  Copyright © 2018 ARMANDO. All rights reserved.
//

import UIKit


final class episodesListVC: UIViewController {
        
    @IBOutlet weak var TableView: UITableView!
    
        var episodesSeason:[Episode]
        init(arrayEpisodes:[Episode]){
            self.episodesSeason=arrayEpisodes
            super.init(nibName: nil, bundle: nil)
            title = "Episodes \(arrayEpisodes[0].season!.name)"
            
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            TableView.dataSource=self
            TableView.delegate=self
        }
   
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //Alta en notificaciones
        let notificationCenter=NotificationCenter.default
       notificationCenter.addObserver(forName: Notification.Name(rawValue: SEASON_DID_CHANGE_NOTIFICATION_NAME), object: nil, queue: OperationQueue.main) { (notification) in
            // userInfo is the payload send by sender of notification
            if let userInfo = notification.userInfo {
                // Safely unwrap the name sent out by the notification sender
                let season = userInfo[SEASON_KEY] as! Season
                self.episodesSeason = season.sortedEpisodes
                self.syncModelWithView()
            }
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //Baja en notificaciones . Otra posibilidad es en el deInit() <= buscar en internet
        NotificationCenter.default.removeObserver(self)
        //NotificationCenter.default.removeObserver(self, name: Notification.Name(HOUSE_DID_CHANGE_NOTIFICATION_NAME), object: nil)
        
    }
    
    
    
    
    
    
    
    
    
        //MARK: - Sync
        func syncModelWithView(){
            self.title="Episodes \(episodesSeason[0].season!.name)"
            TableView.reloadData()
        }
        
    }
    // MARK: - UITableViewDataSource
    
    extension episodesListVC : UITableViewDataSource{
        
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return episodesSeason.count
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let idCell="re-use"
            let currentEpisode=episodesSeason[indexPath.row]
            let cell=tableView.dequeueReusableCell(withIdentifier: idCell) ?? UITableViewCell(style: .default, reuseIdentifier: idCell)
            cell.textLabel?.text =  "(\(currentEpisode.number)) \(currentEpisode.title)"
            cell.detailTextLabel?.text=String(describing: currentEpisode.emissionDate)
            //cell.imageView?.image=currentEpisode.
            return cell
        }
        //    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        let episode = episodesSeason[indexPath.row]
        //        //delegate?.funcDelegateSeasonListVCDelegate(self, didSelectedRow : season.sortedEpisodes)
        //    }
        
    }

extension episodesListVC : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Que casa han pulsado
        let episode=episodesSeason[indexPath.row]
        //Crear un controlador de detalle de la casa
        let WikiViewVC=WikiViewController(model:episode)
        //Hacer un push
        navigationController?.pushViewController(WikiViewVC, animated: true)
    }
}

