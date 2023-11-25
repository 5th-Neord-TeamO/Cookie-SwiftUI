//
//  LobbyView.swift
//  Cookie-SwiftUI
//
//  Created by 김유빈 on 2023/11/25.
//

import SwiftUI

struct LobbyView: View {
    @ObservedObject private var lobbyViewModel = LobbyViewModel()
    
    @State private var hasRoom: Bool = true
    
    var body: some View {
        VStack {
            HStack {
                Text("COOKIE")
                    .font(
                        Font.system(size: 24)
                            .weight(.black)
                    )
                    .foregroundColor(Color(red: 0.21, green: 0.07, blue: 0.07))
                    .padding(.leading, 30)
                Spacer()
                NavigationLink(destination: UserSettingView(toggleManager: ToggleManager())) {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding(.trailing, 20)
                }
            }
            
            ScrollView {
                VStack {
                    if hasRoom {
                        RoomView()
                    } else {
                        NoRoomView()
                    }
                }
            }
        }
        .background(Image("background")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .ignoresSafeArea())
    }
}

struct RoomView: View {
    @ObservedObject private var lobbyViewModel = LobbyViewModel()
    
    var body: some View {
        VStack {
            HStack {
                NavigationLink(destination: EnterView()) {
                    HStack {
                        Image("plus-circle")
                            .padding(.leading, 15)
                        VStack(alignment: .leading){
                            Text("JOIN하기")
                                .font(
                                    Font.system(size: 17)
                                        .weight(.semibold)
                                )
                                .foregroundColor(Color(red: 0.21, green: 0.07, blue: 0.07))
                            
                            Text("참여코드를 입력하세요")
                                .font(
                                    Font.system(size: 11)
                                        .weight(.semibold)
                                )
                                .foregroundColor(Color("OrangeColor"))
                        }
                        Spacer()
                    }
                    .foregroundColor(.black)
                    .frame(width: 270, height: 91)
                    .background(Color(red: 0.98, green: 0.98, blue: 0.98).opacity(0.98))
                    
                    .cornerRadius(20)
                    .shadow(color: Color(red: 0.34, green: 0.17, blue: 0.17).opacity(0.25), radius: 5, x: 0, y: 2)
                }
                
                NavigationLink(destination: LobbyMakeView()) {
                    Image("cookie")
                        .foregroundColor(.clear)
                        .frame(width: 80, height: 91)
                        .background(Color("OrangeColor"))
                        .cornerRadius(20)
                        .shadow(color: Color(red: 0.34, green: 0.17, blue: 0.17).opacity(0.25), radius: 5, x: 0, y: 2)
                }
            }
            .padding(.top, 0)
            
            HStack {
                Text("쿠키박스")
                    .font(
                        Font.system(size: 20)
                            .weight(.bold)
                    )
                    .foregroundColor(Color(red: 0.21, green: 0.07, blue: 0.07))
                
                Text("JOIN")
                    .font(
                        Font.system(size: 14)
                    )
                    .foregroundColor(Color(red: 0.6, green: 0.6, blue: 0.6))
                
                Text("최신순")
                    .font(
                        Font.system(size: 14)
                    )
                    .foregroundColor(Color(red: 0.6, green: 0.6, blue: 0.6))
            }
            .padding(.top, 15)
            .padding(.leading, 30)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(lobbyViewModel.myBoard, id: \.id) { boardData in
                        TeamView(boardData: boardData)
                            .frame(width: 220, height: 324)
                            .padding(.leading, 20)
                    }
                }
                .padding(.vertical, 5)
            }
            
            HStack {
                Text("쿠키박스")
                    .font(
                        Font.system(size: 20)
                            .weight(.bold)
                    )
                    .foregroundColor(Color(red: 0.21, green: 0.07, blue: 0.07))
                
                Text("HOST")
                    .font(
                        Font.system(size: 14)
                    )
                    .foregroundColor(Color(red: 0.6, green: 0.6, blue: 0.6))
                
                Text("최신순")
                    .font(
                        Font.system(size: 14)
                    )
                    .foregroundColor(Color(red: 0.6, green: 0.6, blue: 0.6))
            }
            .padding(.top, 15)
            .padding(.leading, 30)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack {
                ForEach(lobbyViewModel.myBoard, id: \.id) { boardData in
                    GroupView(boardData: boardData)
                        .frame(width: 377, height: 91)
                        .background(.white)
                        .cornerRadius(20)
                        .shadow(color: Color(red: 0.34, green: 0.17, blue: 0.17).opacity(0.25), radius: 5, x: 0, y: 2)
                }
            }
            .padding(.horizontal, 20)
        }
    }
}

struct TeamView: View {
    let boardData: BoardData
    
    var body: some View {
        VStack(alignment: .leading) {
            if let url = URL(string: boardData.imgURL), let imageData = try? Data(contentsOf: url) {
                Image(uiImage: UIImage(data: imageData) ?? UIImage())
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 200)
                    .cornerRadius(35)
                    .padding(.top, 10)
                    .padding(.horizontal, 10)
            } else {
                Image(systemName: "photo")
                    .frame(width: 200, height: 200)
                    .cornerRadius(35)
                    .padding(.top, 10)
                    .padding(.horizontal, 10)
            }
            
            Text(boardData.title)
                .font(
                    Font.system(size: 20)
                        .weight(.semibold)
                )
                .foregroundColor(Color(red: 0.21, green: 0.07, blue: 0.07))
                .padding(.horizontal, 10)
            
            Text(boardData.description)
                .font(
                    Font.system(size: 16)
                )
                .foregroundColor(Color(red: 0.6, green: 0.6, blue: 0.6).opacity(0.6))
                .padding(.horizontal, 10)
            
            HStack(spacing: -40) {
                Text("참여멤버 \(boardData.memberImgURLList.count)명")
                    .font(
                        Font.system(size: 11)
                    )
                    .foregroundColor(Color(red: 0.6, green: 0.6, blue: 0.6).opacity(0.6))
                    .padding(.leading, 10)
                
                Spacer()
                
                ForEach(boardData.memberImgURLList, id: \.self) { imageUrlString in
                    AsyncImage(url: URL(string: imageUrlString)) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 35, height: 35)
                                .cornerRadius(35)
                                .padding(.top, 5)
                                .padding(.horizontal, 10)
                        case .failure:
                            Image(systemName: "photo")
                                .frame(width: 50, height: 50)
                                .cornerRadius(10)
                                .padding(.top, 10)
                                .padding(.horizontal, 10)
                        @unknown default:
                            EmptyView()
                        }
                    }
                }
            }
            
            Spacer()
        }
        .background(Color.white)
        .cornerRadius(40)
        .shadow(color: Color(red: 0.34, green: 0.17, blue: 0.17).opacity(0.25), radius: 5, x: 0, y: 2)
    }
}

struct GroupView: View {
    let boardData: BoardData
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                if let url = URL(string: boardData.imgURL), let imageData = try? Data(contentsOf: url) {
                    Image(uiImage: UIImage(data: imageData) ?? UIImage())
                        .scaledToFit()
                        .frame(maxWidth: 77, maxHeight: 81)
                        .cornerRadius(20)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 10)
                } else {
                    Image(systemName: "photo")
                        .frame(width: 77, height: 81)
                        .cornerRadius(20)
                        .padding(.top, 10)
                        .padding(.horizontal, 10)
                }
            }
            VStack(alignment: .leading) {
                Text(boardData.title)
                    .font(
                        Font.system(size: 20)
                            .weight(.semibold)
                    )
                    .foregroundColor(Color(red: 0.21, green: 0.07, blue: 0.07))
                
                Text(boardData.description)
                    .font(
                        Font.system(size: 16)
                    )
                    .foregroundColor(Color(red: 0.6, green: 0.6, blue: 0.6).opacity(0.6))
            }
            .padding(.top, 25)
            Spacer()
            HStack(spacing: -40) {
                ForEach(boardData.memberImgURLList, id: \.self) { imageUrlString in
                    AsyncImage(url: URL(string: imageUrlString)) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 35, height: 35)
                                .cornerRadius(35)
                                .padding(.top, 5)
                                .padding(.horizontal, 10)
                        case .failure:
                            Image(systemName: "photo")
                                .frame(width: 50, height: 50)
                                .cornerRadius(10)
                                .padding(.top, 10)
                                .padding(.horizontal, 10)
                        @unknown default:
                            EmptyView()
                        }
                    }
                }
            }
            .padding(.top, 30)
            
        }
    }
}

struct NoRoomView: View {
    var body: some View {
        VStack {
            HStack {
                NavigationLink(destination: EnterView()) {
                    HStack {
                        Image("plus-circle")
                            .padding(.leading, 15)
                        VStack(alignment: .leading){
                            Text("JOIN하기")
                                .font(
                                    Font.system(size: 17)
                                        .weight(.semibold)
                                )
                                .foregroundColor(Color(red: 0.21, green: 0.07, blue: 0.07))
                            
                            Text("참여코드를 입력하세요")
                                .font(
                                    Font.system(size: 11)
                                        .weight(.semibold)
                                )
                                .foregroundColor(Color("OrangeColor"))
                        }
                        Spacer()
                    }
                    .foregroundColor(.black)
                    .frame(width: 270, height: 91)
                    .background(Color(red: 0.98, green: 0.98, blue: 0.98).opacity(0.98))
                    
                    .cornerRadius(20)
                    .shadow(color: Color(red: 0.34, green: 0.17, blue: 0.17).opacity(0.25), radius: 5, x: 0, y: 2)
                }
                
                NavigationLink(destination: LobbyMakeView()) {
                    Image("cookie")
                        .foregroundColor(.clear)
                        .frame(width: 80, height: 91)
                        .background(Color("OrangeColor"))
                        .cornerRadius(20)
                        .shadow(color: Color(red: 0.34, green: 0.17, blue: 0.17).opacity(0.25), radius: 5, x: 0, y: 2)
                }
            }
            .padding(.top, 0)
            
            HStack {
                Text("쿠키박스")
                    .font(
                        Font.system(size: 20)
                            .weight(.bold)
                    )
                    .foregroundColor(Color(red: 0.21, green: 0.07, blue: 0.07))
                
                Text("JOIN")
                    .font(
                        Font.system(size: 14)
                    )
                    .foregroundColor(Color(red: 0.6, green: 0.6, blue: 0.6))
            }
            .padding(.top, 15)
            .padding(.leading, 30)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("아직 열어본 쿠키박스가 없어요!")
                .font(
                    Font.system(size: 20)
                        .weight(.semibold)
                )
                .foregroundColor(Color(red: 0.31, green: 0.31, blue: 0.31))
                .padding(.top, 10)
                .padding(.leading, 30)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("초대코드를 입력해 쿠키박스에 JOIN하세요")
                .font(
                    Font.system(size: 16)
                )
                .foregroundColor(Color(red: 0.6, green: 0.6, blue: 0.6))
                .padding(.leading, 30)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Image("join-cookie")
            
            HStack {
                Text("쿠키박스")
                    .font(
                        Font.system(size: 20)
                            .weight(.bold)
                    )
                    .foregroundColor(Color(red: 0.21, green: 0.07, blue: 0.07))
                
                Text("HOST")
                    .font(
                        Font.system(size: 14)
                    )
                    .foregroundColor(Color(red: 0.6, green: 0.6, blue: 0.6))
            }
            .padding(.leading, 30)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("아직 만들어 본 쿠키박스가 없어요!")
                .font(
                    Font.system(size: 20)
                        .weight(.semibold)
                )
                .foregroundColor(Color(red: 0.31, green: 0.31, blue: 0.31))
                .padding(.top, 10)
                .padding(.leading, 30)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("쿠키박스의 호스트가 되어보세요")
                .font(
                    Font.system(size: 16)
                )
                .foregroundColor(Color(red: 0.6, green: 0.6, blue: 0.6))
                .padding(.leading, 30)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Image("host-cookie")
        }
        .navigationBarTitle("", displayMode: .inline)
    }
}
