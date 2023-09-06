//
//  DiaryTableRepository.swift
//  PhotoGramRealm
//
//  Created by JongHoon on 2023/09/06.
//

import Foundation
import RealmSwift

protocol DiaryTableRepositoryType: AnyObject {
    func fetch() -> Results<DiaryTable>
    func fetchFilter() -> Results<DiaryTable>
    func createItem(_ item: DiaryTable)
}

final class DiaryTableRepository: DiaryTableRepositoryType {
    
    private let realm = try! Realm()
    
    private func a() { // => 다른 파일에서 쓸 일 없고, 클래스 안에서만 쓸 수 이씀 => 오버라이딩 불가능 => final 키워드를 잠재적으로 유추
        
    }
    
    func checkSchemaVersion() {
        do {
            let version = try schemaVersionAtURL(realm.configuration.fileURL!)
            print("Schema Version: \(version)")
        } catch {
            print(error)
        }
    }
    
    func fetch() -> Results<DiaryTable> {
        return realm
            .objects(DiaryTable.self)
            .sorted(
                byKeyPath: "diaryTitle",
                ascending: true
            )
    }
    
    /// photo != nil 인 레코드들
    func fetchFilter() -> Results<DiaryTable> {
        let result = realm.objects(DiaryTable.self).where {
            $0.photo != nil
        }
        return result
    }
    
    func createItem(_ item: DiaryTable) {
        do {
            try realm.write {
                realm.add(item)
            }
        } catch {
            print(error)
        }
    }
    
    func updateItem(
        id: ObjectId,
        title: String,
        contents: String
    ) {
        do {
            try realm.write {   // transaction
                realm.create(
                    DiaryTable.self,
                    value: [
                        "_id": id,
                        "diaryTitle": title,
                        "diaryContents": contents
                    ],
                    update: .modified
                )
            }
        } catch {
            print(error)
        }
    }
}

