//
//  LobbyViewModel.swift
//  Cookie-SwiftUI
//
//  Created by 김유빈 on 2023/11/26.
//

import Foundation
import Moya

class LobbyViewModel: ObservableObject {
    @Published var myBoard: [BoardData] = []
    private let provider = MoyaProvider<CookieAPI>()
    
    init() {
        fetchBoard()
    }
    
    func fetchBoard() {
        provider.request(.getBoard) { result in
            switch result {
            case let .success(response):
                do {
                    let boardResponse = try response.map(BoardResponse.self)
                    self.myBoard = boardResponse.data
                    print("Test 성공:\(self.myBoard)")
                } catch {
                    print("Error parsing response: \(error)")
                }
                
            case let .failure(error):
                print("Network request failed: \(error)")
            }
        }
    }
}
