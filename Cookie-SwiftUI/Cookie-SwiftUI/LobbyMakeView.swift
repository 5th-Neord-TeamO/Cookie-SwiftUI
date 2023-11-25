//
//  LobbyMakeView.swift
//  Cookie-SwiftUI
//
//  Created by 김유빈 on 2023/11/25.
//

import SwiftUI

struct LobbyMakeView: View {
    @State private var title: String = ""
    @State private var subtitle: String = ""
    @State private var place: String = ""
    @State private var openPhoto = false
    @State private var uiImage: UIImage? = UIImage(systemName: " ")
    
    @Environment(\.presentationMode) var presentationMode
    
    var isButtonDisabled: Bool {
        return title.isEmpty || subtitle.isEmpty || uiImage == nil
    }
    
    var buttonBackgroundColor: Color {
        return isButtonDisabled ? Color("OrangeColor").opacity(0.5) : Color("OrangeColor")
    }
    
    func resizeAndCropImage(image: UIImage?, targetSize: CGSize) -> UIImage? {
        guard let image = image else { return nil }
        
        let newSize = CGSize(width: targetSize.width, height: targetSize.width * image.size.height / image.size.width)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        defer { UIGraphicsEndImageContext() }
        
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        image.draw(in: rect)
        
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Image("cookie1")
                    
                    Text("COOKIE BOX 만들기")
                        .font(
                            Font.system(size: 24)
                                .weight(.semibold)
                        )
                        .foregroundColor(.black)
                    
                    Text("* 작성한 그룹명과 부제목은 수정이 가능해요!")
                        .font(
                            Font.system(size: 11)
                                .weight(.semibold)
                        )
                        .foregroundColor(Color("OrangeColor"))
                        .padding(.top, 10)
                    
                    VStack {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 352, height: 309)
                                .background(.white.opacity(0.5))
                                .background(
                                    ZStack {
                                        LinearGradient(
                                            stops: [
                                                Gradient.Stop(color: Color(red: 0.95, green: 0.74, blue: 0.11), location: 0.00),
                                                Gradient.Stop(color: Color(red: 0.95, green: 0.58, blue: 0.26), location: 0.38),
                                            ],
                                            startPoint: UnitPoint(x: 0.5, y: 0),
                                            endPoint: UnitPoint(x: 0.5, y: 1)
                                        )
                                        .cornerRadius(40)
                                        
                                        if let selectedImage = uiImage {
                                            Image(uiImage: resizeAndCropImage(image: selectedImage, targetSize: CGSize(width: 352, height: 309)) ?? UIImage(systemName: " ")!)
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 352, height: 309)
                                                .clipped()
                                                .cornerRadius(40)
                                        } else {
                                            Color.clear
                                        }
                                    }
                                )
                                .cornerRadius(40)
                                .padding(.top, 10)
                            
                            Button(action: {
                                self.openPhoto = true
                            }) {
                                Image("plusImage")
                            }
                            .sheet(isPresented: $openPhoto) {
                                ImagePicker(sourceType: .photoLibrary, selectedImage: self.$uiImage, uiImage: self.$uiImage)
                            }
                        }
                        .padding(.bottom, 10)
                        
                        Text("* 영문, 숫자, 공백 포함 최대 10글자까지 작성 가능해요.")
                            .font(
                                Font.system(size: 11)
                                    .weight(.semibold)
                            )
                            .foregroundColor(Color("OrangeColor"))
                            .padding(.trailing, 60)
                        
                        TextField("그룹 이름", text: $title)
                            .padding()
                            .font(
                                Font.system(size: 20)
                                    .weight(.semibold)
                            )
                            .foregroundColor(.black)
                            .frame(width: 323, height: 51)
                            .cornerRadius(20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .inset(by: 0.5)
                                    .stroke(Color(red: 0.85, green: 0.85, blue: 0.85), lineWidth: 1)
                            )
                            .onChange(of: title) { newValue in
                                if newValue.count > 10 {
                                    title = String(newValue.prefix(10))
                                }
                            }
                        
                        TextField("부제목", text: $subtitle)
                            .padding()
                            .font(
                                Font.system(size: 16)
                                    .weight(.semibold)
                            )
                            .foregroundColor(.black)
                            .frame(width: 323, height: 69)
                            .cornerRadius(20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .inset(by: 0.5)
                                    .stroke(Color(red: 0.85, green: 0.85, blue: 0.85), lineWidth: 1)
                                
                            )
                            .lineLimit(2)
                        
                        Button(action: {
                            
                        }){
                            NavigationLink(destination: InviteView()) {
                                Text("만들기")
                                    .font(
                                        Font.system(size: 20)
                                            .weight(.semibold)
                                    )
                                    .foregroundColor(.white)
                                    .frame(width: 323, height: 70)
                                    .background(buttonBackgroundColor)
                                    .cornerRadius(20)
                                    .shadow(color: .black.opacity(0.25), radius: 5, x: 0, y: 2)
                                    .padding(.bottom, 20)
                                    .padding(.top, 20)
                            }}

                        .disabled(isButtonDisabled)
                        
                        /*
                        Button("만들기") {
                            
                        }
                        .font(
                            Font.system(size: 20)
                                .weight(.semibold)
                        )
                        .foregroundColor(.white)
                        .frame(width: 323, height: 70)
                        .background(buttonBackgroundColor)
                        .cornerRadius(20)
                        .shadow(color: .black.opacity(0.25), radius: 5, x: 0, y: 2)
                        .padding(.bottom, 20)
                        .padding(.top, 20)
                        .disabled(isButtonDisabled)*/
                    }
                    .frame(width: 380, height: 619)
                    .background(.white)
                    .cornerRadius(40)
                    .shadow(color: Color(red: 0.34, green: 0.17, blue: 0.17).opacity(0.25), radius: 5, x: 0, y: 2)
                    .padding(.horizontal, 5)
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
                        Image(systemName: "person.crop.circle")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding(.trailing, 20)
                    }
                }
            }
        )
    }
}
struct ImagePicker: UIViewControllerRepresentable {
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    @Binding var selectedImage: UIImage?
    @Binding var uiImage: UIImage?
    
    @Environment(\.presentationMode) private var presentationMode
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = sourceType
        imagePicker.delegate = context.coordinator
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.selectedImage = image
                parent.uiImage = image
            }
            
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}
