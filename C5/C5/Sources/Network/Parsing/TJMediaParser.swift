//
//  TJMediaParser.swift
//  Headliner
//
//  Created by Soop on 8/14/25.
//

import SwiftSoup

struct KaraokeNumber {
    let number: String
    let title: String
    let artist: String
    let lyricist: String
    let composer: String
    let youtubeQuery: String
}

class TJMediaParser {
    static func parseKaraokeNumbers(
        from html: String
    ) -> [KaraokeNumber] {
        var results: [KaraokeNumber] = []
        
        do {
            let doc = try SwiftSoup.parse(html)

            let results: Elements = try doc.select("div.music-search-list.type2")
            
            for result in results {
                // #wrap > div > div > div.music.chart-top.type2 > div:nth-child(2) > ul > li:nth-child(2) > p
                //                    print(result)
                let resultMessage = try result.select("div > ul > li > p").text()
                if resultMessage == "검색 결과를 찾을 수 없습니다." { continue }
                
                let elements: Elements = try result.select("ul.chart-list-area > li > ul.grid-container.list.ico")
                
                for element in elements {
                    print("곡번호: ")
                    print(try element.select("li.grid-item.center.pos-type > p > span.num2").text())
                }
            }
        } catch {
            print(
                "HTML 파싱 에러: \(error)"
            )
        }
        
        return results
    }
    
    // 유튜브 URL에서 쿼리 추출
    private static func extractQueryFromYouTubeURL(
        _ url: String
    ) -> String {
        // "query=" 뒤의 값 추출
        if let range = url.range(
            of: "query="
        ) {
            let startIndex = range.upperBound
            let queryValue = String(
                url[startIndex...]
            )
            return queryValue
        }
        return ""
    }
}
