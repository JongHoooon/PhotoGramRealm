//
//  RealmModel.swift
//  PhotoGramRealm
//
//  Created by JongHoon on 2023/09/04.
//

import Foundation

import RealmSwift

class DiaryTable: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var diaryTitle: String         // 일기 제목(필수)
    @Persisted var diaryDate: Date            // 일기 등록 날짜(필수)
    @Persisted var contents: String?          // 일기 내용(옵션)
    @Persisted var photo: String?             // 일기 사진 URL(옵션)
    @Persisted var diaryLike: Bool            // 즐겨찾기 기능(필수)
//    @Persisted var diaryPin: Bool
    @Persisted var diarySummary: String
    
    convenience init(
        title: String,
        date: Date,
        contents: String? = nil,
        photo: String? = nil,
        like: Bool = false
    ) {
        self.init()
        self.diaryTitle = title
        self.diaryDate = date
        self.contents = contents
        self.photo = photo
        self.diaryLike = false
        self.diarySummary = "제목: \(diaryTitle), 내용: \(contents ?? "")"
    }
}


/*
 컬럼 명 수정, 컬럼 추가 하면 migration 오류 발생
 
 
 */

/*
 1. schema
 2. Realm Model(table)
 3. PK 설정
 */

/*
 image 저장 방법
   1. 도뮤먼트에 jpg 저장
   2. data 변환 후 저장
 
 */
