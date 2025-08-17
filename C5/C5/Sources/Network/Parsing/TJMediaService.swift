////
////  TJMediaService.swift
////  Headliner
////
////  Created by Soop on 8/14/25.
////
//
//import Moya
//import Combine
//import SwiftUI
//
//class TJMediaService: ObservableObject {
//    private let provider = MoyaProvider<TJMediaAPI>()
//    @Published var karaokeNumbers: [KaraokeNumber] = []
//    @Published var isLoading = false
//    @Published var errorMessage = ""
//    
//    func searchSongs(searchText: String) {
//        guard !searchText.isEmpty else {
//            errorMessage = "검색어를 입력해주세요."
//            return
//        }
//        
//        isLoading = true
//        errorMessage = ""
//        
//        provider.request(.searchSongs(searchText: searchText, pageNo: 1, pageRowCnt: 100)) { result in
//            DispatchQueue.main.async {
//                self.isLoading = false
//                
//                switch result {
//                case .success(let response):
//                    if let html = String(data: response.data, encoding: .utf8) {
//                        self.karaokeNumbers = TJMediaParser.parseKaraokeNumbers(from: html)
//                        print(html)
//                        if self.karaokeNumbers.isEmpty {
//                            self.errorMessage = "검색 결과가 없습니다."
//                        }
//                    } else {
//                        self.errorMessage = "데이터 변환 실패"
//                    }
//                case .failure(let error):
//                    self.errorMessage = "네트워크 에러: \(error.localizedDescription)"
//                    print("네트워크 에러: \(error)")
//                }
//            }
//        }
//    }
//}
