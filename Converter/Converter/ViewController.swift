//
//  ViewController.swift
//  Converter
//
//  Created by Aleksandr on 24.10.2022.
//

import UIKit

class ViewController: UIViewController {
    private let networkService: NetworkService = .init()
    override func viewDidLoad() {
        super.viewDidLoad()
        networkService.getList { result in
            switch result {
            case .success(let newData):
                print(newData)
            case .failure(let newError):
                print(newError.localizedDescription)
            }
        }
    }
}
