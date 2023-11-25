//
//  InviteView.swift
//  Cookie-SwiftUI
//
//  Created by 김영준 on 11/26/23.
//

import SwiftUI

struct InviteView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        
        NavigationView {
            VStack() {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 40, height: 40)
                    .background(
                        Image("ribbon")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 40, height: 40)
                            .clipped()
                    )
                Text("초대장")
                    .font(.system(size: 16, weight: .heavy))
                    .foregroundStyle(Color.black)
                Text("* 수신한 초대장으로 입장하면 스레드가 시작돼요!")
                    .font(.system(size: 11, weight: .semibold))
                    .foregroundStyle(Color(red: 1, green: 0.64, blue: 0.35))
                    .padding(.top, 10)
                ZStack() {
                    Rectangle()
                        .foregroundStyle(.clear)
                        .frame(width: 350, height: 400)
                        .background(.white.opacity(0.5))
                        .background(
                            LinearGradient(
                                stops: [
                                    Gradient.Stop(color: Color(red: 0.95, green: 0.74, blue: 0.11), location: 0.00),
                                    Gradient.Stop(color: Color(red: 0.95, green: 0.58, blue: 0.26), location: 0.38),
                                ],
                                startPoint: UnitPoint(x: 0.5, y: 0),
                                endPoint: UnitPoint(x: 0.5, y: 1)
                            )
                        )
                        .cornerRadius(40)
                    Rectangle()
                        .foregroundStyle(.clear)
                        .frame(width: 304, height: 172.34645)
                        .background(
                            Image("join-cookie")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 304, height: 172.34645080566406)
                                .clipped()
                        )
                        .padding(EdgeInsets(top: -150, leading: 40, bottom: 0, trailing: 40))
                    ZStack() {
                        RoundedRectangle(cornerRadius: 40)
                            .foregroundStyle(.white)
                            .frame(width: 350, height: 195)
                            .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 0, y: 0)
                        VStack(alignment: .leading) {
                            Text("쿠키박스")
                                .font(.system(size: 11, weight: .semibold))
                                .foregroundStyle(Color(red: 0.95, green: 0.58, blue: 0.26))
                                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                            Text("NEWJEANS")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundStyle(Color(red: 0.21, green: 0.07, blue: 0.07))
                                .padding(EdgeInsets(top: 2, leading: 20, bottom: 0, trailing: 0))
                            Text("내가만든쿠키 너를위해구웠지")
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundStyle(Color(red: 0.6, green: 0.6, blue: 0.6))
                                .padding(.leading, 20)
                            HStack() {
                                Text("날짜")
                                    .font(.system(size: 11, weight: .semibold))
                                    .foregroundStyle(Color(red: 0.85, green: 0.85, blue: 0.85))
                                    .padding(.leading , 20)
                                Text("초대코드")
                                    .font(.system(size: 11, weight: .semibold))
                                    .foregroundStyle(Color(red: 0.85, green: 0.85, blue: 0.85))
                                    .padding(.leading, 115)
                            }
                            .padding(.top, 4)
                            HStack() {
                                ZStack() {
                                    RoundedRectangle(cornerRadius: 20)
                                        .foregroundColor(Color(red: 0.95, green: 0.58, blue: 0.26))
                                        .frame(width: 120, height: 46)
                                        .shadow(color: Color(red: 0.34, green: 0.17, blue: 0.17).opacity(0.25), radius: 5, x: 0, y: 2)
                                    Text("2023.11.25")
                                        .font(.system(size: 20, weight: .semibold))
                                        .foregroundStyle(Color(red: 0.98, green: 0.98, blue: 0.98))
                                }
                                ZStack() {
                                    RoundedRectangle(cornerRadius: 20)
                                        .foregroundStyle(.white)
                                        .frame(width: 166, height: 46)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 20)
                                                .stroke(Color.orange, lineWidth: 1)
                                        )
                                        .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 0, y: 0)
                                    HStack() {
                                        Text("H2Y5")
                                            .font(.system(size: 20, weight: .bold))
                                            .foregroundColor(Color(red: 0.95, green: 0.58, blue: 0.26))
                                            .padding(.leading, 24)
                                        Spacer()
                                        Button {
                                            // 버튼이 클릭되었을 때 수행할 동작
                                        } label: {
                                            Image("copy")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 20, height: 20)
                                        }
                                        .padding(.trailing, 20)
                                    }
                                    .frame(width: 186, height: 46)
                                }
                                .offset(x: 11)
                            }
                            .padding(.top, -3)
                        }
                    }
                    .padding(EdgeInsets(top: 350, leading: 40, bottom: 0, trailing: 40))
                    
                }
                .padding(.top, -75)
                VStack() {
                    ZStack() {
                        Rectangle()
                            .foregroundStyle(.clear)
                            .frame(width: 350, height: 70)
                            .background(Color(red: 0.95, green: 0.58, blue: 0.26))
                            .cornerRadius(20)
                            .shadow(color: Color(red: 0.34, green: 0.17, blue: 0.17).opacity(0.25), radius: 5, x: 0, y: 2)
                        HStack() {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 40, height: 40)
                                .background(
                                    Image("star")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 40, height: 40)
                                        .clipped()
                                )
                            
                            Text("오픈")
                                .foregroundStyle(Color.white)
                                .font(.system(size: 20, weight: .bold))
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 40, height: 40)
                                .background(
                                    Image("star")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 40, height: 40)
                                        .clipped()
                                )
                        }
                    }
                    .padding(.top, 15)
                }
            }
            .background(Image("background")
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea())
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading: HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                }
                .buttonStyle(RoundedRectangleButtonStyle())
            },
            trailing: HStack {
                Button(action: {
                    
                }) {
                    NavigationLink(destination: UserSettingView(toggleManager: ToggleManager())) {
                        
                    }
                }
                .buttonStyle(RoundedRectanglePlusButtonStyle())
            }
        )
    }
}

/*
#Preview {
    InviteView()
}
*/
