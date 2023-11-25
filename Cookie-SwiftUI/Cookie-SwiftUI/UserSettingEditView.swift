//
//  UserSettingEditView.swift
//  Cookie-SwiftUI
//
//  Created by 김영준 on 11/25/23.
//

import SwiftUI

class ToggleManager: ObservableObject {
    @Published var isToggled = false
}

struct UserSettingEditView: View {
    let circleSize = 80.0
    let roundedRectangleHeight: CGFloat = 650.0
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var toggleManager = ToggleManager()
    var body: some View {
        NavigationView {
            VStack() {
                VStack() {
                    VStack() {
                        ZStack() {
                            RoundedRectangle(cornerRadius: 50)
                                .fill(.white)
                                .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 0, y: 0)
                                .frame(height: roundedRectangleHeight)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                            Circle()
                                .fill(.white)
                                .frame(width: circleSize + 7)
                                .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 0, y: 0)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: roundedRectangleHeight, trailing: 0))
                            Rectangle()
                                .fill(.white)
                                .frame(width: circleSize + 30, height: circleSize)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: roundedRectangleHeight - circleSize, trailing: 0))
                            
                            VStack() {
                                HStack() {
                                    Text("민트색 웨하스")
                                        .font(.system(size: 24, weight: .semibold))
                                        .foregroundStyle(Color.black)
                                    Image(systemName: "pencil")
                                        .resizable()
                                        .frame(width: 15, height: 15)
                                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                                }
                                Text("2023.11.25 가입")
                                    .font(.system(size: 16, weight: .semibold))
                                  .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.67))
                                HStack() {
                                    Text("푸시알림 허용")
                                        .font(.system(size: 20, weight: .semibold))
                                        .foregroundStyle(Color(red: 0.67, green: 0.67, blue: 0.67))
                                    Spacer()
                                    Toggle(isOn: $toggleManager.isToggled) {
                                    }
                                    .toggleStyle(SwitchToggleStyle(tint: Color(red: 0.95, green: 0.58, blue: 0.26)))
                                }
                                .padding(2)
                                .padding(.top, 20)
                                HStack() {
                                    Text("참여중인 쿠키박스")
                                        .font(.system(size: 20, weight: .semibold))
                                      .foregroundStyle(Color(red: 0.67, green: 0.67, blue: 0.67))
                                    Spacer()
                                    Text("8개")
                                        .font(.system(size: 20, weight: .semibold))
                                        .foregroundStyle(Color(red: 0.95, green: 0.58, blue: 0.26))
                                }
                                .padding(2)
                                .padding(.top, 40)
                                HStack() {
                                    Text("내가 생성한 쿠키박스")
                                        .font(.system(size: 20, weight: .semibold))
                                        .foregroundStyle(Color(red: 0.67, green: 0.67, blue: 0.67))
                                    Spacer()
                                    Text("3개")
                                        .font(.system(size: 20, weight: .semibold))
                                        .foregroundStyle(Color(red: 0.95, green: 0.58, blue: 0.26))
                                }
                                .padding(2)
                                HStack() {
                                    Text("내가 조인한 쿠키박스")
                                        .font(.system(size: 20, weight: .semibold))
                                      .foregroundStyle(Color(red: 0.67, green: 0.67, blue: 0.67))
                                    Spacer()
                                    Text("5개")
                                        .font(.system(size: 20, weight: .semibold))
                                        .foregroundStyle(Color(red: 0.95, green: 0.58, blue: 0.26))
                                }
                                .padding(2)
                                HStack() {
                                    Text("테마")
                                        .font(.system(size: 20, weight: .semibold))
                                      .foregroundStyle(Color(red: 0.67, green: 0.67, blue: 0.67))
                                    Spacer()
                                    Text("W")
                                        .font(.system(size: 20, weight: .semibold))
                                        .foregroundStyle(Color(red: 0.95, green: 0.58, blue: 0.26))
                                }
                                .padding(2)
                                .padding(.top, 40)
                                HStack() {
                                    Text("버전")
                                        .font(.system(size: 20, weight: .semibold))
                                      .foregroundStyle(Color(red: 0.67, green: 0.67, blue: 0.67))
                                    Spacer()
                                    Text("beta")
                                        .font(.system(size: 20, weight: .semibold))
                                        .foregroundStyle(Color(red: 0.95, green: 0.58, blue: 0.26))
                                }
                                .padding(2)
                                .padding(.top, 40)
                                Spacer()
                                Text("@cookie")
                                    .font(.system(size: 16, weight: .semibold))
                                  .foregroundStyle(Color(red: 0.67, green: 0.67, blue: 0.67))
                                  .offset(y: 50)
                            }
                            .frame(width: 300, height: roundedRectangleHeight - circleSize - 30)
                            Circle()
                                .fill(.blue)
                                .frame(width: circleSize)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: roundedRectangleHeight, trailing: 0))
                        }
                    }
                    .frame(height: roundedRectangleHeight + circleSize * 2)
                    .offset(y: circleSize)
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
                        //서버 데이터 동기화
                    presentationMode.wrappedValue.dismiss()
                }) {
                        Text("SAVE")
                            .font(Font.system(size: 17))
                            .foregroundStyle(Color.black)
                    
                }
            }
        )
    }
}

/*
#Preview {
    UserSettingEditView()
}
*/
