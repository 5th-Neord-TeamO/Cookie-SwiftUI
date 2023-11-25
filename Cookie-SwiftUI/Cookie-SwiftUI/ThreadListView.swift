//
//  ThreadListView.swift
//  Cookie-SwiftUI
//
//  Created by 김영준 on 11/26/23.
//

import SwiftUI

struct ThreadListView: View {
    @Binding var subtitle: String
    @Binding var content: String
    @Binding var isShowList: Bool
    
    var body: some View {
        VStack() {
            ZStack() {
                RoundedRectangle(cornerRadius: 40)
                    .foregroundStyle(.white)
                    .frame(width: 320, height: 265)
                    .shadow(color: Color(red: 0.34, green: 0.17, blue: 0.17).opacity(0.25), radius: 5, x: 0, y: 2)
                
                VStack() {
                    HStack() {
                        Spacer()
                        Button(action: {
                            isShowList = false
                        }) {
                            Text("17:39")
                                .font(.system(size: 15))
                                .foregroundStyle(.black)
                                .padding(.leading, 20)
                            Spacer()
                            Image(systemName: "square.and.pencil")
                                .resizable()
                                .foregroundStyle(.black)
                                .frame(width: 15, height: 15)
                                .padding(EdgeInsets(top: 0, leading: 130, bottom: 5, trailing: 0))
                        }
                    }
                    .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 20))
                    HStack() {
                        Text(subtitle)
                            .font(.system(size: 20))
                            .foregroundStyle(.black)
                        Spacer()
                    }
                    .padding(.leading, 20)
                    HStack() {
                        Text(content)
                            .font(.system(size: 16))
                            .foregroundStyle(Color(red: 0.67, green: 0.67, blue: 0.67))
                        Spacer()
                    }
                    .padding(.leading, 20)
                    
                    Spacer()
                    HStack() {
                        Image(systemName: "person.crop.circle")
                            .resizable()
                            .frame(width: 15, height: 15)
                            .foregroundStyle(.black)
                            .padding(.leading, 20)
                        Text("username")
                            .font(.system(size: 11, weight: .none))
                            .foregroundStyle(Color(red: 0.67, green: 0.67, blue: 0.67))
                        Spacer()
                        Image("messageSquare")
                            .resizable()
                            .frame(width: 15, height: 15)
                            .padding(.trailing, 20)
                        
                    }
                    .padding(.bottom, 20)
                }
                .frame(width: 320, height: 265)
            }
            
        }
    }
}

#Preview {
    ThreadListView(subtitle: .constant("Your Subtitle"), content: .constant("Your Subtitle"), isShowList: .constant(true))
}
