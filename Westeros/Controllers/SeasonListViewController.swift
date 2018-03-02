

import UIKit
let SEASON_DID_CHANGE_NOTIFICATION_NAME = "SeasonDidChange"
let SEASON_KEY="SeasonKey"
protocol SeasonListVCDelegate:AnyObject{
    func funcDelegateSeasonListVCDelegate(_ VC:SeasonListViewController,didSelectedRow:Season)
}


final class SeasonListViewController: UIViewController {
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    
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
        appdelegate.splitVC?.showDetailViewController(((appdelegate.ViewsState?.VCs[(appdelegate.ViewsState?.clickedButtonBarTab)!])?.wrappedInNavigation())!, sender: self)
        delegate?.funcDelegateSeasonListVCDelegate(self, didSelectedRow : season)
        //Otra manera distinta al delegado para enviar notifficaciones =>notificaciones
        //Pero es más indirecto que un delegate, ya que el delegate asocia los dos elementos asociados
        //Mejor siempre con delegate
        let notificationCenter=NotificationCenter.default
        let notification=Notification(name: Notification.Name(rawValue: SEASON_DID_CHANGE_NOTIFICATION_NAME), object: self,userInfo: [SEASON_KEY:season])
        notificationCenter.post(notification)
        switch UIApplication.shared.statusBarOrientation {
        //En estado PORTRAIT
        case .portrait,.portraitUpsideDown:
            appdelegate.splitVC?.preferredDisplayMode = .primaryHidden
            break
        //En estado LANDSCAPE
        case .landscapeLeft,.landscapeRight:
            appdelegate.splitVC?.preferredDisplayMode = .allVisible
            break
        case .unknown:
            break
        }
        
    }
}














