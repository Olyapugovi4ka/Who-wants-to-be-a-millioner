//
//  CatalogPresenter.swift
//  Builder
//
//  Created by Olga Melnik on 01.11.2019.
//  Copyright © 2019 Olga Melnik. All rights reserved.
//

import Foundation
protocol Presenter {
    var messageInfo: String { get }
}

class CatalogPresenter {
    weak var viewController: CataloViewController?
    var messageInfo = "Создать viewModel для представления"
    
    
}
