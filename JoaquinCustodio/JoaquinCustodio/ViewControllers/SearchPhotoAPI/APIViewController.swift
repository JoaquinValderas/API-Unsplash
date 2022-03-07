//
//  APIViewController.swift
//  JoaquinCustodio
//
//  Created by Joaquin Custodio  on 17/2/22.
//

import Foundation
import UIKit

class APIViewController: UIViewController {
    
    private var viewModel:ViewModel = ViewModel()
    
    override func viewDidLoad() {
        viewModel.executeAPI()
        
        
    }
}
