//
//  MapVC.swift
//  Constraint_Coding
//
//  Created by Islomjon on 01/08/22.
//

import UIKit
import WebKit

class MapVC: UIViewController {
    
    var mapCounytry:String = ""
    
    
    let webView: WKWebView = {
        let web = WKWebView()
        web.translatesAutoresizingMaskIntoConstraints = false
        return web
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        print(mapCounytry)
        setUI()
        webView.allowsBackForwardNavigationGestures = true
        let url = URL(string: mapCounytry) ?? URL(string: "https://goo.gl/maps")
        let request = URLRequest(url: url!)
        webView.load(request)
    }
    
    func setUI(){
        
        self.view.addSubview(webView)
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
        ])
        
        webView.navigationDelegate = self
    }

}

//MARK: - WKNavigationDelegate -

extension MapVC: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        showAlert(title: "Error", description: error.localizedDescription)
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        showAlert(title: "Error", description: error.localizedDescription)
    }
    
}
