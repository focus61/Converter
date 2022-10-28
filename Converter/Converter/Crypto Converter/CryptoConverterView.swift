//
//  CryptoConverterView.swift
//  Converter
//
//  Created by Aleksandr on 27.10.2022.
//

import UIKit

final class CryptoConverterView: UIView {
    private let tableView: UITableView = .init(frame: .zero, style: .insetGrouped)
    private let menuArray: [String] = [
        "List Endpoint",
        "Live Data",
        "Conversion Endpoint"
    ]
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CryptoTableViewCell.self, forCellReuseIdentifier: CryptoTableViewCell.identifier)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        tableView.frame = bounds
    }
}
extension CryptoConverterView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuArray.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CryptoTableViewCell.identifier, for: indexPath)
        guard let nameCell = cell as? CryptoTableViewCell else { return cell }
        let name = menuArray[indexPath.row]
        nameCell.fillNameLabel(text: name)
        return nameCell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Crypto convert type"
    }
}

final class CryptoTableViewCell: UITableViewCell {
    static let identifier = "CryptoTableViewCell"
    private let chevroneImageView: UIImageView = .init(frame: .zero)
    private let nameLabel: UILabel = .init(frame: .zero)
    private let chevroneImageViewSize = CGSize(width: 10, height: 10)
    private let horizontalSpace: CGFloat = 20
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        subviewsConfigure()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    fileprivate func subviewsConfigure() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(chevroneImageView)
        chevroneImageView.image = UIImage(systemName: "chevron.right")
        chevroneImageView.tintColor = .gray
    }
    fileprivate func calculateFrame() {
        let width = contentView.frame.width
        let height = contentView.frame.height
        let nameLabelX = contentView.frame.origin.x + horizontalSpace
        chevroneImageView.frame.size = chevroneImageViewSize
        chevroneImageView.frame.origin = CGPoint(x: width - (chevroneImageViewSize.width * 2), y: height / 2 - (chevroneImageViewSize.height / 2))
        nameLabel.frame.origin.x = nameLabelX
        nameLabel.sizeToFit()
        nameLabel.frame.origin.y = height / 2 - (nameLabel.frame.height / 2)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        calculateFrame()
    }
    func fillNameLabel(text: String) {
        nameLabel.text = text
    }
}
