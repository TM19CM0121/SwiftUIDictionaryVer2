//
//  Dictionary.swift
//  SwiftUIDictionaryVer2
//
//  Created by T.R.Marigold on 2020/02/18.
//  Copyright © 2020 高良昌辰. All rights reserved.
//

import Foundation

struct Dictionary: Codable,Identifiable {
    var id: Int
    var Module_Name: String
    var Module_Description: String
    var Module_Picture: String
    var Module_Video_Effect: String
}

/// list。この中に配列としてデータを入れ込む。なかなかに大変。
var list: [Dictionary] = [
    Dictionary(id: 0,
               Module_Name: "Text",
               Module_Description: "1行以上の読み取り専用テキストを表示するビュー。",
               Module_Picture: "Text_Image",
               Module_Video_Effect: "Text_movie"),
    
    Dictionary(id: 1,
               Module_Name: "Image",
               Module_Description: "環境に依存する画像を表示するビュー。",
               Module_Picture: "Image_Image",
               Module_Video_Effect: "Image_movie"),
    
    Dictionary(id: 2,
               Module_Name: "Button",
               Module_Description: "トリガーされたときにアクションを実行するコントロール。",
               Module_Picture: "Button_Image",
               Module_Video_Effect: "Button_movie"),
    
    Dictionary(id: 3,
               Module_Name: "View",
               Module_Description: "Viewプロトコルに準拠する型を宣言して、カスタムビューを作成します。必要なbody計算プロパティを実装して、カスタムビューのコンテンツを提供します。",
               Module_Picture: "View_Image",
               Module_Video_Effect: "どのような効果があるかがわかる動画の名前"),
    Dictionary(id: 4,
               Module_Name: "HStack",
               Module_Description: "モジュールを水平線に配置するビュー。",
               Module_Picture: "HStack_Image",
        Module_Video_Effect: "どのような効果があるかがわかる動画の名前"),
    Dictionary(id: 5,
               Module_Name: "VStack",
               Module_Description: "モジュールを垂直線に配置するビュー。",
               Module_Picture: "VStack_Image",
               Module_Video_Effect: "どのような効果があるかがわかる動画の名前")
]
