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
    
    @IBOutlet weak var commentName: UITextField!
    @IBOutlet weak var commentField: UITextField!
    
    var postData:PostData?
    
    @IBAction func commentPost(_ sender: Any) {
        
        var updateValue: FieldValue
        
        updateValue = FieldValue.arrayUnion([(commentName),(commentField)])
        
        let postRef = Firestore.firestore().collection(Const.PostPath).document(postData!.id)
        postRef.updateData(["comments": updateValue])
        
        // 投稿処理が完了したので先頭画面に戻る
        UIApplication.shared.windows.first{ $0.isKeyWindow }?.rootViewController?.dismiss(animated: true, completion: nil)
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}
