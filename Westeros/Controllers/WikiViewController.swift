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
    let allModel:AnyObject
    
    
    //MARK: - Initialization
    init(model:AnyObject)
    {   //Si no es House lo castea a Person
        self.allModel=model
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
    
    //MARK: - Sync
    func syncModelWithView(){
        var url : URL
        if (allModel is House){
            url = (allModel as! House).wikiURL
        } else{
            url = (allModel as! Person).wikiURL
        }
        webView.load(URLRequest(url:url))
    }
    
}
//Hay que extender la clase e implementar el protocolo
extension WikiViewController:WKNavigationDelegate{
    //Cuando termina de cargarse la web, qué hacer
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        aIndicatorView.stopAnimating()
        aIndicatorView.isHidden=true
    }
    //Activar/desactivar los link de la web que se muestra
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
