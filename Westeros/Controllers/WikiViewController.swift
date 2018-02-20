//
//  WikiViewController.swift
//  Westeros
//
//  Created by ARMANDO on 15/2/18.
//  Copyright © 2018 ARMANDO. All rights reserved.
//

import UIKit
import WebKit
 
 
 
class WikiViewController: UIViewController {

    //MARK: - outlets
    @IBOutlet weak var webView: WKWebView!
   
    @IBOutlet weak var aIndicatorView: UIActivityIndicatorView!
    
   //MARK: - Properties
    var model:House
    
    
    //MARK: - Initialization
    init(model:House)
    {
        self.model=model
        //Siempre llamar a super.init
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate=self
        aIndicatorView.startAnimating()
        aIndicatorView.isHidden=false
        syncModelWithView()
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
        NotificationCenter.default.removeObserver(self, name: Notification.Name(HOUSE_DID_CHANGE_NOTIFICATION_NAME), object: nil)
        
    }
    
    @objc func houseDidChange(notification: Notification) {
        //let sender=notification.object
        // We only want to process notifications when sent by the object of type AuthorizedUser
        //guard (sender as? Dictionary) != nil else {
        //    return
        //}
        
        // userInfo is the payload send by sender of notification
        if let userInfo = notification.userInfo {
            // Safely unwrap the name sent out by the notification sender
            self.model = userInfo[HOUSE_KEY] as! House
        }
        syncModelWithView()
       
    }
    
    
    //MARK: - Sync
    func syncModelWithView(){
        title=model.name
        webView.load(URLRequest(url:model.wikiURL))
      
    }
    
}
//Hay que extender la clase e implementar el protocolo
extension WikiViewController:WKNavigationDelegate{
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        aIndicatorView.stopAnimating()
        aIndicatorView.isHidden=true
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        
        let type=navigationAction.navigationType
        
        switch type {
        case .linkActivated ,.formSubmitted:
            decisionHandler(.cancel)
        default:
            decisionHandler(.allow)
        }
    }
    
    
    
    
    
}
