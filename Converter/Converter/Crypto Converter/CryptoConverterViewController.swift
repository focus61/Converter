//
//  CryptoConverterViewController.swift
//  Converter
//
//  Created by Aleksandr on 27.10.2022.
//

import UIKit

final class CryptoConverterViewController: UIViewController {
    private let cryptoConverterView: CryptoConverterView = .init(frame: .zero)
    override func loadView() {
        view = cryptoConverterView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Crypto"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
