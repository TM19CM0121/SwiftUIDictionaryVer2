//
//  ContentView.swift
//  SwiftUIDictionaryVer2
//
//  Created by T.R.Marigold on 2020/02/18.
//  Copyright © 2020 高良昌辰. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var show = false
    @State var showButtonPage = false
    @State var showImagePage = false
    @State var showTextPage = false
    @State var viewState = CGSize(width: 40.0, height: 100.0)
    @State var showingAlert = false
    
    let generator = UINotificationFeedbackGenerator()
    var body: some View {
        VStack {
            ZStack {
                Image("BGSwiftUI.PNG")
                //            BlurView(style: .systemMaterial)
                CardView2()
                    .cornerRadius(10)
                    .shadow(radius: 20)
                    .offset(x: 0, y: show ? -400 : -40)
                    .scaleEffect(0.85)
                    .rotationEffect(Angle(degrees: show ? -15 : 0))
                    .blendMode(.hardLight)
                    .animation(.easeInOut(duration: 0.6))
                    .offset(x: viewState.width, y: viewState.height)
                    .onTapGesture { self.showingAlert = true }
                    .onLongPressGesture { self.showButtonPage = true;self.generator.notificationOccurred(.success)}
                    .sheet(isPresented: $showButtonPage) {
                        DetailView(row: Dictionary(id: 2,
                                                   Module_Name: "Button",
                                                   Module_Description: "トリガーされたときにアクションを実行するコントロール。",
                                                   Module_Picture: "Button_Image",
                                                   Module_Video_Effect: "Button_movie"))
                            .edgesIgnoringSafeArea(.all)
                    }
                    .alert(isPresented: $showingAlert) {
                        Alert(title: Text("(´・ω・｀)"), message: Text("タップじゃなくて長押ししてね"), dismissButton: .default(Text("り")))
                    }
                
                
                CardView()
                    .cornerRadius(10)
                    .shadow(radius: 20)
                    .offset(x: 0, y: show ? -200 : -20)
                    .scaleEffect(0.9)
                    .rotationEffect(Angle(degrees: show ? -10 : 0))
                    .blendMode(.hardLight)
                    .animation(.easeInOut(duration: 0.4))
                    .offset(x: viewState.width, y: viewState.height)
                    .onTapGesture { self.showingAlert = true }
                    .onLongPressGesture { self.showImagePage = true;self.generator.notificationOccurred(.success) }
                    .sheet(isPresented: $showImagePage) {
                        DetailView(row: Dictionary(id: 1,Module_Name: "Image",
                                                   Module_Description: "環境に依存する画像を表示するビュー。",
                                                   Module_Picture: "Image_Image",
                                                   Module_Video_Effect: "Image_movie"))
                            .edgesIgnoringSafeArea(.all)
                }
                
                CertificateView()
                    .offset(x: viewState.width, y: viewState.height)
                    .scaleEffect(0.95)
                    .rotationEffect(Angle(degrees: show ? -5 : 0))
                    .animation(.spring())
                    .onTapGesture {
                        self.show.toggle()
                        ;self.generator.notificationOccurred(.warning)
                }
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            self.viewState = value.translation
                            self.show = true
                    }
                    .onEnded { _ in
                        self.viewState = CGSize(width: 40.0, height: 100.0)
                        self.show = false
                    }
                )
                    .onLongPressGesture { self.showTextPage = true;self.generator.notificationOccurred(.success) }
                    .sheet(isPresented: $showTextPage) {
                        DetailView(row: Dictionary(id: 0,Module_Name: "Text",
                                                   Module_Description: "1行以上の読み取り専用テキストを表示するビュー。",
                                                   Module_Picture: "Text_Image",
                                                   Module_Video_Effect: "Text_movie"))
                            .edgesIgnoringSafeArea(.all)
                }
                    ZStack {
                        BlurView(style: .regular)
                        VStack{
                            LottieView(filename: "Switch")
                                .frame(width: 50, height: 50)
                            Text("ようこそ、SwiftUI図鑑へ！")
                            Text("この図鑑はSwiftUIとCGPointを使用した")
                            Text("近未来風の図鑑です。ちなみにBetaです。")
                            Spacer()
                        }
                    }
                    .frame(width: 400,height: 200)
                    .offset(x: 0,y: 300)
                    .edgesIgnoringSafeArea(.all)
            }
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

struct CardView: View {
    var item = Dictionary(id: 1,Module_Name: "Image",Module_Description: "環境に依存する画像を表示するビュー。",
                          Module_Picture: "Image_Image",Module_Video_Effect: "Image_movie")
    
    var body: some View {
        ZStack {
            Image(item.Module_Picture)
                .resizable()
                //.frame(width: 350,height: 200)
                .aspectRatio(contentMode: .fit)
                .opacity(1)
                .edgesIgnoringSafeArea(.all)
            HStack {
                HStack {
                    Text(item.Module_Name)
                        .font(.title)
                        .bold()
                        .clipped()
                    Spacer()
                }
            }
        }.cornerRadius(30)
            .padding(.horizontal)
            .cornerRadius(10)
            .shadow(radius: 10)
            .frame(width: 340.0, height: 220.0)
    }
}

struct CardView2: View {
    var item = Dictionary(id: 2,
                          Module_Name: "Button",
                          Module_Description: "トリガーされたときにアクションを実行するコントロール。",
                          Module_Picture: "Button_Image",
                          Module_Video_Effect: "Button_movie")
    
    var body: some View {
        ZStack {
            Image(item.Module_Picture)
                .resizable()
                //.frame(width: 350,height: 200)
                .aspectRatio(contentMode: .fit)
                .opacity(1)
                .edgesIgnoringSafeArea(.all)
            HStack {
                HStack {
                    Text(item.Module_Name)
                        .font(.title)
                        .bold()
                        .clipped()
                    Spacer()
                }
            }
        }.cornerRadius(30)
            .padding(.horizontal)
            .cornerRadius(10)
            .shadow(radius: 10)
            .frame(width: 340.0, height: 220.0)
    }
}

struct CertificateView: View {
    
    var item = Dictionary(id: 0,
                          Module_Name: "Text",
                          Module_Description: "1行以上の読み取り専用テキストを表示するビュー。",
                          Module_Picture: "Text_Image",
                          Module_Video_Effect: "Text_movie")
    
    var body: some View {
        ZStack {
            Image(item.Module_Picture)
                .resizable()
                //.frame(width: 350,height: 200)
                .aspectRatio(contentMode: .fit)
                .opacity(1)
                .edgesIgnoringSafeArea(.all)
            HStack {
                HStack {
                    Text(item.Module_Name)
                        .font(.title)
                        .bold()
                        .clipped()
                    Spacer()
                }
            }
        }.cornerRadius(30)
            .padding(.horizontal)
            .frame(width: CGFloat(340), height: CGFloat(220))
            .cornerRadius(10)
            .shadow(radius: 10)
    }
}

struct TitleView: View {
    var body: some View {
        return VStack {
            HStack {
                Text("Certificates")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                
                Spacer()
            }
            Image("Illustration5")
            
            Spacer()
        }.padding()
    }
}

struct ModuleView: View {
    //var dictionary: Dictionary
    @State private var show_modal: Bool = false
    var body: some View {
        ZStack {
            VStack {
                List(list) { (row:Dictionary) in
                    NavigationLink(destination: DetailView(row: row)) {
                        ModuleView_Detail(list: list, row: row)
                            .edgesIgnoringSafeArea(.all)
                    }.edgesIgnoringSafeArea(.all)
                }//.rotation3DEffect(Angle( degrees: 10), axis: (x: 0, y: 10.0, z: 0))
                Button(action: {
                    self.show_modal = true
                }, label: {
                    Text("公式ドキュメントを表示する")
                }).sheet(isPresented: self.$show_modal) {
                    SafariView(url: URL(string: "https://developer.apple.com/documentation/swiftui")!)
                        .edgesIgnoringSafeArea(.all)
                }
            }.navigationBarTitle("Module")
        }
    }
}

struct DetailView: View {
    var row: Dictionary
    var body: some View {
        VStack {
            Spacer()
            Text(row.Module_Name)
                .font(.largeTitle)
            Spacer()
            Text(row.Module_Description)
                .bold()
            Image(row.Module_Picture)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(row.Module_Video_Effect)
                .frame(height: 200)
            Spacer()
        }
    }
}

struct ModuleView_Detail: View {
    var list: [Dictionary]
    var row: Dictionary
    var body: some View {
        ZStack {
            Image(row.Module_Picture)
                .resizable()
                //.frame(width: 350,height: 200)
                .aspectRatio(contentMode: .fit)
                .opacity(0.3)
                .edgesIgnoringSafeArea(.all)
            HStack {
                HStack {
                    Text(row.Module_Name)
                        .font(.title)
                        .bold()
                        .clipped()
                    Spacer()
                }
            }
        }.cornerRadius(30)
    }
}

struct BlurView: UIViewRepresentable {
    
    let style: UIBlurEffect.Style
    
    func makeUIView(context: UIViewRepresentableContext<BlurView>) -> UIView {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        let blurEffect = UIBlurEffect(style: style)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(blurView, at: 0)
        NSLayoutConstraint.activate([
            blurView.heightAnchor.constraint(equalTo: view.heightAnchor),
            blurView.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])
        return view
    }
    
    func updateUIView(_ uiView: UIView,
                      context: UIViewRepresentableContext<BlurView>) {}
}
