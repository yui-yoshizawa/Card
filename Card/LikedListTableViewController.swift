//
//  LikedListTableViewController.swift
//  Card
//
//  Created by 原田悠嗣 on 2019/08/10.
//  Copyright © 2019 原田悠嗣. All rights reserved.
//

import UIKit

class LikedListTableViewController: UITableViewController {
    
    // いいね」された名前の一覧
    var likedPerson: [[String: String]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 作ったセル呼び出し
        // （xibファイルを作ると、自動的にnibファイルができる）
        // （xibファイルから、最終的にnibファイルが作られる）
        // （nibファイルは、xibファイルと同じファイル名になる）
        // "TableViewCall"というファイルを読み込んで、"customCell"という名前で使えるようにしてね！ って意味。
        self.tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
    }
    
    // MARK: - Table view data source
    
    // 必須:セルの数を返すメソッド
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // いいねされたユーザーの数
        return likedPerson.count
    }
    
    // 必須:セルの設定
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! TableViewCell
        
        // いいねされた人の情報を表示
        cell.imageView?.image = UIImage(named: likedPerson[indexPath.row]["personImage"] ?? "")
        cell.personNameLabel?.text = likedPerson[indexPath.row]["personName"]
        cell.personProfessionLabel?.text = likedPerson[indexPath.row]["personProfession"]
        cell.personHometownLabel?.text = likedPerson[indexPath.row]["personHometown"]
        
        return cell
    }
}

