//
//  ViewController.swift
//  RxSwiftWidget
//
//  Created by Sreynin on 2023/07/06.
//

import UIKit
import RxSwift
import RxDataSources

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var myTableView: UITableView!
    
    let disposeBag = DisposeBag()
    
    let mainVM = MainViewModel()
    var dataSource : RxTableViewSectionedReloadDataSource<SectionOfCustomData>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Hello")
        let sections = self.mainVM.setUpInfo()
        
        let dataSource = RxTableViewSectionedReloadDataSource<SectionOfCustomData>(configureCell: { ds, tv, indexPath, item in
            let cell = tv.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! CustomTableViewCell
            cell.itemTitleLbl.text = item.itemTitle
            return cell
            
        },canEditRowAtIndexPath: { _,_ in
            return true
        })
        
       self.dataSource = dataSource
        
        Observable.just(sections)
            .bind(to: myTableView.rx.items(dataSource:dataSource))
            .disposed(by: disposeBag)
        
        myTableView.rx.setDelegate(self)
            .disposed(by: disposeBag)
        
        
        myTableView.rx.itemSelected
            .subscribe(onNext: { indexPath in
                let data = dataSource[indexPath.section]
                switch data.header {
                case .Observable :
                    let vc = DetailViewController.instantiateFromStoryboard()
                    vc.titleVC  = data.header.rawValue
                    vc.itemData = data.items[indexPath.row]
                    self.navigationController?.pushViewController(vc, animated: true)
                case .Subjects   : break
                }
            }).disposed(by: disposeBag)
    }


}

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    
        return CGFloat(40.0)
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "HeaderCell") as! CustomTableViewCell
        cell.headerTitleLbl.text = dataSource?[section].header.rawValue
        return cell.contentView
    }
}
