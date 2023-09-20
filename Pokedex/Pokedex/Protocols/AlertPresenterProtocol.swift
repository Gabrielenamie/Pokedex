//
//  AlertPresenter.swift
//  Pokedex
//
//  Created by Gabriele Namie on 28/08/23.
//

import UIKit

protocol AlertPresenterProtocol {
    
    func alertPresenter(_ alert: UIAlertController)
}

extension AlertPresenterProtocol where Self: CoordinatorProtocol {
    
    func alertPresenter(_ alert: UIAlertController) {
        DispatchQueue.main.async {
            self.navigationController.present(alert, animated: true, completion: nil)
        }
    }
}
