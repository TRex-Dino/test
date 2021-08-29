//
//  DetailInfoViewControllerPresentor.swift
//  MVP
//

import Foundation

protocol DetailInfoViewControllerInputPresentorProtocol {
    init(view: DetailsInfoViewControllerProtocol, model: News)
}

protocol DetailsInfoViewControllerOutputPresentorProtocol {
    var model: News { get }
    func prepareData()
}

class DetailInfoViewControllerPresentor: DetailInfoViewControllerInputPresentorProtocol, DetailsInfoViewControllerOutputPresentorProtocol {
    
    
    
    var model: News

    private weak var view: DetailsInfoViewControllerProtocol!

    required init(view: DetailsInfoViewControllerProtocol, model: News) {
        self.view = view
        self.model = model

    }
    
    func prepareData() {
        view.settingView()
    }
    
}

