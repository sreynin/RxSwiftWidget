//
//  DetailViewController.swift
//  RxSwiftWidget
//
//  Created by Sreynin on 2023/07/07.
//

import UIKit

class DetailViewController: UIViewController,Instantiable {
    static var storyboardName: StringConvertible {return StoryboardName.mainSB}
    
    @IBOutlet weak var vcTitleLbl       : UILabel!
    @IBOutlet weak var articleTitleLbl  : UILabel!
    @IBOutlet weak var dscTextView      : UITextView!
    
    var titleVC      : String?
   
    var itemData : sectionItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupView()
    }
    

    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    func setupView(){
        self.vcTitleLbl.text        = self.titleVC
        self.articleTitleLbl.text   = "*" + (self.itemData?.itemTitle ?? "")
        self.dscTextView.text       = self.itemData?.dscStr ?? ""
    }

}
