////
////  ParsingView.swift
////  Headliner
////
////  Created by Soop on 8/14/25.
////
//
//import SwiftUI
//
//struct ParsingView: View {
//    @StateObject private var tjService = TJMediaService()
//    @State private var searchText = "nct wish"
//    
//    var body: some View {
//        NavigationView {
//            VStack {
//                // 검색 영역
//                HStack {
////                    TextField("곡제목, 가수명 입력", text: $searchText)
////                        .textFieldStyle(RoundedBorderTextFieldStyle())
////                        .onSubmit {
////                            tjService.searchSongs(searchText: searchText)
////                        }
//                    
//                    Button("검색") {
//                        tjService.searchSongs(searchText: searchText)
//                    }
//                    .buttonStyle(.borderedProminent)
//                }
//                .padding()
//                
//                // 결과 영역
//                if tjService.isLoading {
//                    ProgressView("검색 중...")
//                        .frame(maxWidth: .infinity, maxHeight: .infinity)
//                } else if !tjService.errorMessage.isEmpty {
//                    Text(tjService.errorMessage)
//                        .foregroundColor(.red)
//                        .frame(maxWidth: .infinity, maxHeight: .infinity)
//                } else if tjService.karaokeNumbers.isEmpty {
//                    Text("검색어를 입력하세요")
//                        .foregroundColor(.gray)
//                        .frame(maxWidth: .infinity, maxHeight: .infinity)
//                } else {
//                    List(tjService.karaokeNumbers, id: \.number) { karaoke in
//                        VStack(alignment: .leading, spacing: 4) {
//                            HStack {
//                                Text("곡번호: \(karaoke.number)")
//                                    .font(.headline)
//                                    .foregroundColor(.blue)
//                                Spacer()
//                            }
//                            
//                            Text(karaoke.title)
//                                .font(.title3)
//                                .fontWeight(.semibold)
//                            
//                            Text("가수: \(karaoke.artist)")
//                                .font(.subheadline)
//                                .foregroundColor(.secondary)
//                            
//                            if !karaoke.lyricist.isEmpty {
//                                Text("작사: \(karaoke.lyricist)")
//                                    .font(.caption)
//                                    .foregroundColor(.secondary)
//                            }
//                            
//                            if !karaoke.composer.isEmpty {
//                                Text("작곡: \(karaoke.composer)")
//                                    .font(.caption)
//                                    .foregroundColor(.secondary)
//                            }
//                        }
//                        .padding(.vertical, 2)
//                    }
//                }
//                
//                Spacer()
//            }
//            .navigationTitle("TJ 노래방 검색")
//        }
//    }
//}
//
//#Preview {
//    ParsingView()
//}
