//
//  ThreadPopupView.swift
//  Cookie-SwiftUI
//
//  Created by 김영준 on 11/26/23.
//

import SwiftUI

struct ThreadPopupView: View {
    @State private var subtitle: String = ""
    @State private var content: String = ""
    @Binding var isShowPopup: Bool
    
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
                                isShowPopup = false
                        }) {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(red: 0.98, green: 0.64, blue: 0.47))
                                .frame(width: 55, height: 30)
                                .overlay(
                                    Image(systemName: "checkmark")
                                        .foregroundStyle(.white)
                                        .frame(width: 15, height: 15)
                                )
                        }
                    }
                    .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 20))
                    TextField("소제목", text: $subtitle)
                        .font(.system(size: 20, weight: .bold))
                        .textFieldStyle(PlainTextFieldStyle())
                        .lineLimit(1)
                        .padding(.leading, 20)
                        .onChange(of: subtitle) { newSubtitle in
                            if newSubtitle.count > 25 {
                                subtitle = String(newSubtitle.prefix(25))
                            }
                        }
                    TextField("내용", text: $content)
                        .font(.system(size: 16))
                        .textFieldStyle(PlainTextFieldStyle())
                        .lineLimit(6)
                        .padding(EdgeInsets(top: 5, leading: 20, bottom: 0, trailing: 0))
                    Spacer()
                    HStack() {
                        Image(systemName: "person.crop.circle")
                            .resizable()
                            .frame(width: 15, height: 15)
                            .padding(.leading, 20)
                            .foregroundStyle(.black)
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

// MARK: - BackgroundClearView
struct BackgroundClearView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = .clear
        }
        return view
    }
    func updateUIView(_ uiView: UIView, context: Context) {}
}

struct ClearBackgroundViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        if #available(iOS 16.4, *) {
            content
                .presentationBackground(.clear)
        } else {
            content
                .background(BackgroundClearView())
        }
    }
}

extension View {
    func clearModalBackground()->some View {
        self.modifier(ClearBackgroundViewModifier())
    }
}

#Preview {
    ThreadPopupView(isShowPopup: .constant(true))
}
