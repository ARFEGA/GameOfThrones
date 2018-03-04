//
//  SeasonDetailVC.swift
//  Westeros
//
//  Created by ARMANDO on 26/2/18.
//  Copyright © 2018 ARMANDO. All rights reserved.
//

import UIKit

final class SeasonDetailVC: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var titleSeason: UILabel!
    @IBOutlet weak var imageSeason: UIImageView!
    @IBOutlet weak var plotSeason: UILabel!
    
    //MARK: - POPERTIES
    var detailSeasonModel:Season
    init(detailSeason:Season){
        self.detailSeasonModel=detailSeason
        super.init(nibName:nil,bundle:Bundle(for: type(of:self)))
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: plotSeason.bottomAnchor).isActive=true
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        syncModelWithView()
        setUp()
    }

    func syncModelWithView(){
        self.titleSeason.text = detailSeasonModel.name
        self.imageSeason.image=detailSeasonModel.image
        self.plotSeason.text=detailSeasonModel.plot
    }
    
    func setUp(){
        let butonEpisodes=UIBarButtonItem(title: "Episodes", style: .plain, target: self, action: #selector(displayEpisodesVC))
        butonEpisodes.tintColor=UIColor(red:0.20, green:0.20, blue:0.00, alpha:1.0)
        navigationItem.rightBarButtonItem=butonEpisodes
    }
    @objc func displayEpisodesVC(){
        //Creamos el wikiVC
        let episodesVC=episodesListVC(arrayEpisodes: detailSeasonModel.sortedEpisodes)
        navigationController?.pushViewController(episodesVC, animated: true)
    }
    

}

// MARK: - SeasonListVCDelegate
extension SeasonDetailVC : SeasonListVCDelegate{
    func funcDelegateSeasonListVCDelegate(_ VC: SeasonListViewController, didSelectedRow season: Season) {
        self.detailSeasonModel = season
        syncModelWithView()
    }
}
