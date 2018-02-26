

import UIKit

protocol SeasonListVCDelegate:AnyObject{
    func funcDelegateSeasonListVCDelegate(_ VC:SeasonListViewController,didSelectedRow:[Episode])
}


final class SeasonListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let seasonModel:[Season]
    weak var delegate:SeasonListVCDelegate?
    init(model:[Season]){
        self.seasonModel=model
        //super.init(style: .grouped)
        super.init(nibName: nil, bundle: nil)
        title="SEASONS"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource=self
        tableView.delegate=self
    }
}

extension SeasonListViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return seasonModel.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let idCell="re-use"
        let currentSeason=seasonModel[indexPath.row]
        let cell=tableView.dequeueReusableCell(withIdentifier: idCell) ?? UITableViewCell(style: .default, reuseIdentifier: idCell)
        cell.textLabel?.text=currentSeason.name
        cell.detailTextLabel?.text=String(currentSeason.number)
        cell.imageView?.image=currentSeason.image
        return cell
    }
    
    
}

extension SeasonListViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let season = seasonModel[indexPath.row]
        delegate?.funcDelegateSeasonListVCDelegate(self, didSelectedRow : season.sortedEpisodes)
    }
}














