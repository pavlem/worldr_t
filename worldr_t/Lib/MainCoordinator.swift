//
//  MainCoordinator.swift
//  Ebay_t
//
//   Created by Pavle Mijatovic on 12.5.21..
//

import UIKit

class MainCoordinator: Coordinator {
    
    var childCoordinator = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = InfoVC()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func open(infoDetailsVM: InfoDetailsVM) {
        let vc = InfoDetailsVC()
        vc.vm = infoDetailsVM
        navigationController.pushViewController(vc, animated: true)
    }
}
