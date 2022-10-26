//
//  BaseCoordinator.swift
//  bolomio
//
//  Created by Serdar Aylanc on 13.09.2020.
//  Copyright © 2020 Serdar Aylanc. All rights reserved.
//

import Foundation
import UIKit

class BaseCoordinator: NSObject, Coordinator {
    
    // MARK: - Vars & Lets
    var childCoordinators = [Coordinator]()
    
    // MARK: - Public methods
    
    func addDependency(_ coordinator: Coordinator) {
        for element in childCoordinators {
            if element === coordinator { return }
        }
        childCoordinators.append(coordinator)
    }
    
    func removeDependency(_ coordinator: Coordinator?) {
        guard childCoordinators.isEmpty == false, let coordinator = coordinator else { return }
        
        for (index, element) in childCoordinators.enumerated() {
            if element === coordinator {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
    // MARK: - Coordinator
    
    func start() {
        start(with: nil)
    }
    
    func start(with option: DeepLinkOption?) {
        
    }
}
