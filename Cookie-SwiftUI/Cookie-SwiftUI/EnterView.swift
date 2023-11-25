//
//  EnterView.swift
//  Cookie-SwiftUI
//
//  Created by 김유빈 on 2023/11/25.
//

import SwiftUI
import Combine

struct EnterView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var code: [String] = Array(repeating: "", count: 4)
    @State private var hasUserInteracted = false
    
    var isCodeComplete: Bool {
        return code.allSatisfy { !$0.isEmpty }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Image("Magicwand")
                
                Text("참여코드 입력")
                    .font(
                        Font.system(size: 24)
                            .weight(.semibold)
                    )
                    .foregroundColor(.black)
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                
                if hasUserInteracted && !isCodeComplete {
                    Text("* 참여코드를 찾을 수 없어요. 오타가 없는지 확인해주세요!")
                        .font(
                            Font.system(size: 11)
                                .weight(.bold)
                        )
                        .foregroundColor(Color(red: 0.21, green: 0.07, blue: 0.07))
                }
                
                HStack(spacing: 10) {
                    ForEach(0..<4) { index in
                        TextField("", text: Binding(
                            get: {
                                code[index]
                            },
                            set: { newValue in
                                let filtered = newValue.filter { $0.isLetter || $0.isNumber }
                                code[index] = String(filtered.prefix(1))
                                hasUserInteracted = true
                            }
                        ))
                        .textFieldStyle(CodeTextFieldStyle(hasError: !isCodeComplete, hasUserInteracted: hasUserInteracted))
                        .multilineTextAlignment(.center)
                        .onReceive(Just(code[index])) { _ in
                            if code[index].count > 1 {
                                code[index] = String(code[index].prefix(1))
                            }
                        }
                    }
                }
                
                Spacer()
                
                if isCodeComplete {
                    Image("join-cookie")
                }
                
                Button(action: {
                    if isCodeComplete {
                        print(code.joined())
                    }
                }) {
                    NavigationLink(destination: InviteView()) {
                        Text("참여하기")
                            .font(
                                Font.system(size: 24)
                                    .weight(.semibold)
                            )
                            .foregroundColor(.black)
                            .frame(width: 329, height: 70)
                            .background(isCodeComplete ? Color.white : Color(UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)))
                            .cornerRadius(20)
                            .shadow(color: .black.opacity(0.25), radius: 5, x: 0, y: 2)
                            .padding(.bottom, 20)
                            .disabled(!isCodeComplete)
                    }
                }
            }
            .background(Image("background2")
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea())
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(
                leading: HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        
                    }
                    .buttonStyle(RoundedRectangleButtonStyle())
                }
            )
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct CodeTextFieldStyle: TextFieldStyle {
    var hasError: Bool
    var hasUserInteracted: Bool
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding()
            .frame(width: 80, height: 98)
            .background(Color(red: 0.98, green: 0.98, blue: 0.98).opacity(0.98))
            .cornerRadius(20)
            .shadow(color: Color(red: 0.34, green: 0.17, blue: 0.17).opacity(0.25), radius: 5, x: 0, y: 2)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .inset(by: 0.5)
                    .stroke(hasError && hasUserInteracted ? Color.red : Color.white, lineWidth: 1)
            )
    }
}
