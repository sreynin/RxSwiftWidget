//
//  MainViewModel.swift
//  RxSwiftWidget
//
//  Created by Sreynin on 2023/07/06.
//

import Foundation


enum sectionType : String {
    case Observable = "Obervable"
    case Subjects   = "Subject"
}

class MainViewModel {
     
    func setUpInfo() -> [SectionOfCustomData]{
        
       let  sectionObservableArrObj = [
                                    sectionItem(itemTitle: "one element, using .just"
                                                   , dscStr:
                                                    "let observable1 = Observable.just(1)\nlet subscription1 = observable1.subscribe { (event) in \n print(event)\n}\n\noutput:\n next(1)\ncompleted\n"),
                                       
                                       sectionItem(itemTitle: "multiple elements, using.of"
                                                   , dscStr: "let observable2 = Observable.of(1,2,3) //Here its three events, one element each\nlet subscription2 = observable2.subscribe { (event) in\nif let element = event.element{ \nprint(element)\n}\n\n\nwhich results in output:\n1\n2\n3\n}\n\nAnother way is to use a different closure, illustrated by subscribing to observable3\n\nlet observable3 = Observable.of([1,2,3])\nlet subscription3 = observable3.subscribe(onNext: { (element) in\nprint(element)\n})\n\nwhich gives the result:\n[1, 2, 3]"),
                                    
                                       sectionItem(itemTitle: "Creating observable with .from"
                                                   , dscStr: ""),
                                       sectionItem(itemTitle: "Creating custom Observable object .create" , dscStr: "")
                                        ]
        
        let sectionSubjectArrObj = [sectionItem(itemTitle: "PublishSubject"),
                                    sectionItem(itemTitle: "BehaviorSubject"),
                                    sectionItem(itemTitle: "ReplaySubject"),
                                    sectionItem(itemTitle: "BehaviorRelay")]
        
        let sections = [SectionOfCustomData(header:.Observable , items: sectionObservableArrObj),
                        SectionOfCustomData(header:.Subjects   , items: sectionSubjectArrObj)]
        
        return sections
    }
}


