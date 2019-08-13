//
//  ViewController.swift
//  Card
//
//  Created by 原田悠嗣 on 2019/08/10.
//  Copyright © 2019 原田悠嗣. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // ☆viewの動作をコントロールする
    @IBOutlet weak var baseCard: UIView!
    // ☆スワイプ中にgood or bad の表示
    @IBOutlet weak var likeImage: UIImageView!
    
    // ☆ユーザーカード1
    @IBOutlet weak var person1: UIView!
    @IBOutlet weak var personImage1: UIImageView!
    @IBOutlet weak var personName1: UILabel!
    @IBOutlet weak var personProfession1: UILabel!
    @IBOutlet weak var personHometown1: UILabel!
    
    // ☆ユーザーカード2
    @IBOutlet weak var person2: UIView!
    @IBOutlet weak var personImage2: UIImageView!
    @IBOutlet weak var personName2: UILabel!
    @IBOutlet weak var personProfession2: UILabel!
    @IBOutlet weak var personHometown2: UILabel!
    
    // ☆ベースカードの中心
    var centerOfCard: CGPoint!
    
    // ☆ユーザーカードの配列
    var personList: [UIView] = []
    // ☆カードの番号
    var selectedCardCount: Int = 0
    // ☆リストの番号
    var listNum: Int = 0
    //
    var nextListNum: Int = 2
    
    let nameList: [String] = ["津田梅子","ジョージワシントン","ガリレオガリレイ","板垣退助","ジョン万次郎"]
    
    let professionList: [String: String] = [
        "津田梅子": "教師",
        "ジョージワシントン": "大統領",
        "ガリレオガリレイ": "物理学者",
        "板垣退助": "議員",
        "ジョン万次郎": "冒険家"
    ]
    
    let hometownList: [String: String] = [
        "津田梅子": "千葉",
        "ジョージワシントン": "アメリカ",
        "ガリレオガリレイ": "イタリア",
        "板垣退助": "高知",
        "ジョン万次郎": "アメリカ"
    ]
    
    let backgroundColor: [String: UIColor] = [
        "津田梅子": #colorLiteral(red: 1, green: 0.8118392295, blue: 0.7754601246, alpha: 1),
        "ガリレオガリレイ": #colorLiteral(red: 0.8675404454, green: 1, blue: 0.8697308093, alpha: 1),
        "ジョージワシントン": #colorLiteral(red: 0.9836079141, green: 1, blue: 0.8185359941, alpha: 1),
        "板垣退助": #colorLiteral(red: 0.7297981346, green: 0.9208318677, blue: 1, alpha: 1),
        "ジョン万次郎": #colorLiteral(red: 0.9821062897, green: 0.8366400532, blue: 1, alpha: 1)
    ]
    
    // ☆「いいね」をされた名前の配列
    var likedName: [String] = []
    
    // 遷移するかどうか判定するカウント
    var count = 0
    
   

    // ☆? ロード完了時に呼ばれる
    override func viewDidLoad() {
        super.viewDidLoad()
        // personListにperson1, 2を追加
        personList.append(person1)
        personList.append(person2)
    }
    
    // ☆？view表示前に呼ばれる（遷移すると戻ってくる度によばれる）
    override func viewWillAppear(_ animated: Bool) {
        // カウント初期化
        selectedCardCount = 0
        // リスト初期化
        likedName = []
        // 二枚のビューを初期化
        // 前面のビュー
        let name1 = nameList[count]
        // ビューの背景に色をつける
        person1.backgroundColor = backgroundColor["\(name1)"]
        // ラベルに名前を表示
        personName1.text = name1
        // ラベルに職業を表示
        personProfession1.text = professionList["\(name1)"]
        // ラベルに出身地を表示
        personHometown1.text = hometownList["\(name1)"]
        // 画像を表示
        personImage1.image = UIImage(named: "\(name1)")
        
        // 背面のビュー
        let name2 = nameList[count + 1]
        // ビューの背景に色をつける
        person2.backgroundColor = backgroundColor["\(name2)"]
        // ラベルに名前を表示
        personName2.text = name2
        // ラベルに職業を表示
        personProfession2.text = professionList["\(name2)"]
        // ラベルに出身地を表示
        personHometown2.text = hometownList["\(name2)"]
        // 画像を表示
        personImage2.image = UIImage(named: "\(name2)")
    }
    
    // ☆？viewのレイアウト処理が完了した時に呼ばれる
    override func viewDidLayoutSubviews() {
        // ベースカードの中心を代入
        centerOfCard = baseCard.center
        
    }
    
    // ☆？完全に遷移が行われ、スクリーン上からViewControllerが表示されなくなったときに呼ばれる
    override func viewDidDisappear(_ animated: Bool) {
        // カウント初期化
        selectedCardCount = 0
        count = 0
        
        // リスト初期化
        likedName = []
        
        // ビューを整理
        self.view.sendSubviewToBack(person2)
        // alpha値を元に戻す
        person2.alpha = 1
        
        // 二枚のビューを初期化
        // 前面のビュー
        let name1 = nameList[count]
        // ビューの背景に色をつける
        person1.backgroundColor = backgroundColor["\(name1)"]
        // ラベルに名前を表示
        personName1.text = name1
        // ラベルに職業を表示
        personProfession1.text = professionList["\(name1)"]
        // ラベルに出身地を表示
        personHometown1.text = hometownList["\(name1)"]
        // 画像を表示
        personImage1.image = UIImage(named: "\(name1)")
        
        // 背面のビュー
        let name2 = nameList[count + 1]
        // ビューの背景に色をつける
        person2.backgroundColor = backgroundColor["\(name2)"]
        // ラベルに名前を表示
        personName2.text = name2
        // ラベルに職業を表示
        personProfession2.text = professionList["\(name2)"]
        // ラベルに出身地を表示
        personHometown2.text = hometownList["\(name2)"]
        // 画像を表示
        personImage2.image = UIImage(named: "\(name2)")
    }

    

    // ☆？セグエによる遷移前に呼ばれる
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "ToLikedList" {
            let vc = segue.destination as! LikedListTableViewController

            // LikedListTableViewControllerのlikedName(左)にViewCountrollewのLikedName(右)を代入
            vc.likedName = likedName
        }
    }

    
    // 必要？
    func resetPersonList() {
        // 5人の飛んで行ったビューを元の位置に戻す
        for person in personList {
            // 元に戻す処理
            person.center = self.centerOfCard
            person.transform = .identity
        }
    }

    // ☆ベースカードを元に戻す
    func resetCard() {
        // 位置を戻す
        baseCard.center = centerOfCard
        // 角度を戻す
        baseCard.transform = .identity
    }

    
    
    
    // スワイプ処理    ??
    @IBAction func swipeCard(_ sender: UIPanGestureRecognizer) {

        // 【ベースカード / ユーザーカードの動き】について
        // ベースカード
        let card = sender.view!
        // 動いた距離
        let point = sender.translation(in: view)
        // 取得できた距離をcard.centerに加算
        card.center = CGPoint(x: card.center.x + point.x, y: card.center.y + point.y)
        // ユーザーカードにも同じ動きをさせる
        personList[selectedCardCount].center = CGPoint(x: card.center.x + point.x, y:card.center.y + point.y)
        // 元々の位置と移動先との差
        let xfromCenter = card.center.x - view.center.x
        // 角度をつける処理
        card.transform = CGAffineTransform(rotationAngle: xfromCenter / (view.frame.width / 2) * -0.785)
        // ユーザーカードに角度をつける
        personList[selectedCardCount].transform = CGAffineTransform(rotationAngle: xfromCenter / (view.frame.width / 2) * -0.785)

        
        
        
        // 【like・badイメージ表示】について
        // likeImageの表示のコントロール
        if xfromCenter > 0 {
            // goodを表示
            likeImage.image = #imageLiteral(resourceName: "いいね")
            likeImage.isHidden = false
        } else if xfromCenter < 0 {
            // badを表示
            likeImage.image = #imageLiteral(resourceName: "よくないね")
            likeImage.isHidden = false
        }

        
        
        
        // 【カードを飛ばすかどうか】について
        if sender.state == UIGestureRecognizer.State.ended {
            if card.center.x < 50 {
                // 【カードを左に飛ばす場合】
                // 1. カードを左に飛ばす（物理） personList[selectedCardCount] というカード
                UIView.animate(withDuration: 0.5, animations: {
                    self.personList[self.selectedCardCount].center = CGPoint(x: self.personList[self.selectedCardCount].center.x - 500, y :self.personList[self.selectedCardCount].center.y)
                })
                // 2. 遷移するかどうか判定するためのカウントを　+1
                count += 1
                // 3. 遷移するかどうか判定
                if count >= nameList.count {
                    // 遷移する場合の処理
                    performSegue(withIdentifier: "ToLikedList", sender: self)
                } else {
                    // 遷移しない場合
                    // 1. 飛ばしたカードを最背面の元の場所に持ってくる
                    camonCard()
                    
                    // 2. 最背面に行ったカードに、次表示する情報を入れる
                    newCard()
                    
                    // 3. ベースカードの角度と位置を戻す処理
                    resetCard()
                    
                    // 4. likeImageを隠す処理
                    likeImage.isHidden = true
                    
                    // 5. 次のカードへ
                    listNum += 1    // 次のカードのリスト番号
                    nextListNum += 1    // 次のカードが最背面に行った時のリスト番号
                    selectedCardCount += 1
                    selectedCardCount = count % 2    // 次のカード番号。0か1にしたいので2で割ったあまりにする。
                }
               

            } else if card.center.x > self.view.frame.width - 50 {
                // 【カードを右に飛ばす場合】
                // 1. カードを右に飛ばす
                UIView.animate(withDuration: 0.5, animations: {
                self.personList[self.selectedCardCount].center = CGPoint(x: self.personList[self.selectedCardCount].center.x + 500, y :self.personList[self.selectedCardCount].center.y)
                })
                // いいねリストに追加
                likedName.append(nameList[listNum])
                // 2. 遷移するかどうか判定するためのカウントを　+1
                count += 1
                // 3. 遷移するかどうか判定
                if count >= nameList.count {
                    // 遷移する場合の処理
                    performSegue(withIdentifier: "ToLikedList", sender: self)
                } else {
                    // 遷移しない場合
                    // 1. 飛ばしたカードを最背面の元の場所に持ってくる
                    camonCard()
                    
                    // 2. 最背面に行ったカードに、次表示する情報を入れる
                    newCard()
                    
                    // 3. ベースカードの角度と位置を戻す処理
                    resetCard()
                    
                    // 4. likeImageを隠す処理
                    likeImage.isHidden = true
                    
                    // 5. 次のカードへ
                    listNum += 1    // 次のカードのリスト番号
                    nextListNum += 1    // 次のカードが最背面に行った時のリスト番号
                    selectedCardCount += 1
                    selectedCardCount = count % 2    // 次のカード番号。0か1にしたいので2で割ったあまりにする。
                }

            } else {
                // ☆【カードを飛ばさない場合】
                // アニメーションをつける
                UIView.animate(withDuration: 0.5, animations: {
                    // ユーザーカードを元の位置に戻す
                    self.personList[self.selectedCardCount].center = self.centerOfCard
                    // ユーザーカードの角度を元の位置に戻す
                    self.personList[self.selectedCardCount].transform = .identity
                    // ベースカードの角度と位置を戻す
                    self.resetCard()
                    // likeImageを隠す
                    self.likeImage.isHidden = true
                })
            }
        }
    }
    
    // さよならしたカードを最背面の元の場所に持ってくる処理
    func camonCard() {
        // 最背面に
        self.view.sendSubviewToBack(personList[selectedCardCount])
        // 位置を戻す
        personList[selectedCardCount].center = centerOfCard
        // 角度を戻す
        personList[selectedCardCount].transform = .identity
    }
    
    // 最背面に行ったカードに、次表示する情報を入れる処理
    func newCard() {
        if nextListNum < nameList.count {
            // まだ表示するリストがある場合
            let name: String = nameList[nextListNum]
            // 表示するビューを管理する
            if selectedCardCount == 0 {
                // ビューの背景に色をつける
                person1.backgroundColor = backgroundColor["\(name)"]
                // ラベルに名前を表示
                personName1.text = name
                // ラベルに職業を表示
                personProfession1.text = professionList["\(name)"]
                // ラベルに出身地を表示
                personHometown1.text = hometownList["\(name)"]
                // 画像を表示
                personImage1.image = UIImage(named: "\(name)")
            } else {
                // ビューの背景に色をつける
                person2.backgroundColor = backgroundColor["\(name)"]
                // ラベルに名前を表示
                personName2.text = name
                // ラベルに職業を表示
                personProfession2.text = professionList["\(name)"]
                // ラベルに出身地を表示
                personHometown2.text = hometownList["\(name)"]
                // 画像を表示
                personImage2.image = UIImage(named: "\(name)")
            }
        } else {
            // ここにいい感じの処理を
        }
    }
    
    
    
    
   

    // よくないねボタン
    @IBAction func dislikeButtonTapped(_ sender: Any) {

        UIView.animate(withDuration: 0.5, animations: {
            // ベースカードをリセット
            self.resetCard()
            // ユーザーカードを左にとばす
            self.personList[self.selectedCardCount].center = CGPoint(x:self.personList[self.selectedCardCount].center.x - 500, y:self.personList[self.selectedCardCount].center.y)
        })
        camonCard()
        //checkUserCard()
        selectedCardCount += 1
        count += 1
        // 画面遷移
        if count >= nameList.count {
            performSegue(withIdentifier: "ToLikedList", sender: self)
        }
        selectedCardCount = count % 2
    }

    // いいねボタン
    @IBAction func likeButtonTaped(_ sender: Any) {

        UIView.animate(withDuration: 0.5, animations: {
            self.resetCard()
            self.personList[self.selectedCardCount].center = CGPoint(x:self.personList[self.selectedCardCount].center.x + 500, y:self.personList[self.selectedCardCount].center.y)
        })
        camonCard()    //　こいつが悪さをしている
        //checkUserCard()
        // いいねリストに追加
        likedName.append(nameList[selectedCardCount])
        count += 1
        // 画面遷移
        if count >= nameList.count {
            performSegue(withIdentifier: "ToLikedList", sender: self)
        }

        selectedCardCount = count % 2
    }
}


