//
//  BaseTableViewCell.swift
//  PhotoGramRealm
//
//  Created by jack on 2023/09/03.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
        setConstraints()
    }
    
    #warning("unavailable 키워드")
    /// 해당 구문 절대 사용할 일 없다.(스토리 보드, xib를 사용하지 않아서)
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {}
    
    func setConstraints() {}
}
