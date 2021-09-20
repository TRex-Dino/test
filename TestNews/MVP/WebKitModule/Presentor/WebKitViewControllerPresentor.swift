//
//  WebKitViewControllerPresentor.swift
//  MVP
//

import Foundation


protocol WebKitViewControllerPresentorInputProtocol {
    func getUrl()
}

protocol WebKitViewControllerPresentorOutputProtocol {
    init(view: WebKitViewControllerProtocol, url: URL)
}

class WebKitViewControllerPresentor: WebKitViewControllerPresentorOutputProtocol, WebKitViewControllerPresentorInputProtocol {
    
    weak var view: WebKitViewControllerProtocol!
    let url: URL!
    
    required init(view: WebKitViewControllerProtocol, url: URL) {
        self.view = view
        self.url = url
        
        view.setUrl(url)
    }
    
    func getUrl() {
        
    }
    
    
}
