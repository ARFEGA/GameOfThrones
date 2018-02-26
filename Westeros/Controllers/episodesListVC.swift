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
            title = arrayEpisodes[0].season?.name
            
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            TableView.dataSource=self
        }
    override func viewWillAppear(_ animated: Bool) {
        syncModelWithView()
    }
        //MARK: - Sync
        func syncModelWithView(){
            self.title=episodesSeason[0].season?.name
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
            cell.textLabel?.text=currentEpisode.title
            cell.detailTextLabel?.text=String(describing: currentEpisode.emissionDate)
            //cell.imageView?.image=currentEpisode.
            return cell
        }
        //    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        let episode = episodesSeason[indexPath.row]
        //        //delegate?.funcDelegateSeasonListVCDelegate(self, didSelectedRow : season.sortedEpisodes)
        //    }
        
    }

    // MARK: - SeasonListVCDelegate
    extension episodesListVC:SeasonListVCDelegate{
        func funcDelegateSeasonListVCDelegate(_ VC: SeasonListViewController, didSelectedRow arrayEpisodes: [Episode]) {
            self.episodesSeason = arrayEpisodes
            syncModelWithView()
        }
}

