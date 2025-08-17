////
////  TJMediaAPI.swift
////  Headliner
////
////  Created by Soop on 8/14/25.
////
//
//import Moya
//import SwiftUI
//
//enum TJMediaAPI {
//    case searchSongs(searchText: String, pageNo: Int, pageRowCnt: Int)
//}
//
//extension TJMediaAPI: TargetType {
//    var baseURL: URL {
//        return URL(string: "https://www.tjmedia.com")!
//    }
//    
//    var path: String {
//        switch self {
//        case .searchSongs:
//            return "/song/accompaniment_search"
//        }
//    }
//    
//    var method: Moya.Method {
//        switch self {
//        case .searchSongs:
//            return .get
//        }
//    }
//    
//    var task: Moya.Task {
//        switch self {
//        case let .searchSongs(searchText, pageNo, pageRowCnt):
//            return .requestParameters(parameters: [
//                "pageNo": pageNo,
//                "pageRowCnt": pageRowCnt,
//                "strSotrGubun": "ASC",
//                "strSortType": "",
//                "nationType": "",
//                "strType": 1, // <== 0은 통합검색 결과,,, 1은 가수명 결과인데...
//                "searchTxt": searchText
//            ], encoding: URLEncoding.queryString)
//        }
//    }
//    
//    var headers: [String: String]? {
//        return ["User-Agent": "Mozilla/5.0 (iPhone; CPU iPhone OS 17_0 like Mac OS X)"]
//    }
//}
