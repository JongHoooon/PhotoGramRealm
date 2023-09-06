//
//  DetailViewController.swift
//  PhotoGramRealm
//
//  Created by JongHoon on 2023/09/05.
//

import UIKit

import RealmSwift

final class DetailViewController: BaseViewController {
    
    private let repository = DiaryTableRepository()
    var data: DiaryTable?
    
    let titleTextField: WriteTextField = {
        let view = WriteTextField()
        view.placeholder = "제목을 입력해주세요"
        return view
    }()
    
    let contentTextField: WriteTextField = {
        let view = WriteTextField()
        view.placeholder = "내용을 입력해주세요"
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func configure() {
        super.configure()
        view.addSubview(titleTextField)
        view.addSubview(contentTextField)
        
        guard let data = data else { return }
        
        titleTextField.text = data.diaryTitle
        contentTextField.text = data.contents
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "수정",
            style: .plain,
            target: self,
            action: #selector(editButtonClicked)
        )
    }
    
    @objc func editButtonClicked() {
        
        // Realm Update
        guard let data = data else { return }
        
        repository.updateItem(
            id: data._id,
            title: titleTextField.text ?? "",
            contents: contentTextField.text ?? ""
        )
        
        navigationController?.popViewController(animated: true)
    }
    
    override func setConstraints() {
        super.setConstraints()
        
        titleTextField.snp.makeConstraints {
            $0.width.equalTo(300.0)
            $0.height.equalTo(50.0)
            $0.center.equalToSuperview()
        }
        
        contentTextField.snp.makeConstraints {
            $0.width.equalTo(300.0)
            $0.height.equalTo(50.0)
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(60.0)
        }
    }
}
