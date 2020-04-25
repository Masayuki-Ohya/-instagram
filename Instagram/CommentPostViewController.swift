//
//  CommentPostViewController.swift
//  Instagram
//
//  Created by 大矢政行 on 2020/04/24.
//  Copyright © 2020 masayuki.ohya. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class CommentPostViewController: UIViewController {
    
    @IBOutlet weak var commentField: UITextField!
    
    @IBAction func commentPost(_ sender: Any) {
        
        let postData = postArray[indexPath!.row]
        var updateValue: FieldValue

        //コメントデータの保存場所を定義する
        let postRef = Firestore.firestore().collection(Const.PostPath).document(postData.id)
        postRef.updateData(["comments": updateValue])
        
        // HUDで投稿完了を表示する
        SVProgressHUD.showSuccess(withStatus: "コメントしました")
        // 投稿処理が完了したので先頭画面に戻る
        UIApplication.shared.windows.first{ $0.isKeyWindow }?.rootViewController?.dismiss(animated: true, completion: nil)
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}
