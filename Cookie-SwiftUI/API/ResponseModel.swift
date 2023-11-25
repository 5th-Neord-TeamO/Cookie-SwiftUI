//
//  ResponseModel.swift
//  Cookie-SwiftUI
//
//  Created by 김유빈 on 2023/11/26.
//

import Foundation

// MARK: - BoardResponse
struct BoardResponse: Codable {
    let code, message: String
    let data: [BoardData]
}

struct BoardData: Codable {
    let id: Int
    let imgURL: String
    let title, description: String
    let memberImgURLList: [String]

    enum CodingKeys: String, CodingKey {
        case id
        case imgURL = "imgUrl"
        case title, description
        case memberImgURLList = "memberImgUrlList"
    }
}
