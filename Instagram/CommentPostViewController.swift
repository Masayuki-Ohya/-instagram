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
    
    var commentID:String = ""
    
    @IBAction func commentPost(_ sender: Any) {
        
        //let postRef = Firestore.firestore().collection(Const.PostPath).document(postData.id)
        //postRef.updateData(["likes": updateValue])
        
        // 投稿処理が完了したので先頭画面に戻る
        UIApplication.shared.windows.first{ $0.isKeyWindow }?.rootViewController?.dismiss(animated: true, completion: nil)
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}
