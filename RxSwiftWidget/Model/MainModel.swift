//
//  MainModel.swift
//  RxSwiftWidget
//
//  Created by Sreynin on 2023/07/06.
//

import Foundation
import RxDataSources

struct SectionOfCustomData{
    var header: sectionType
    var items : [sectionItem]
}

struct sectionItem {
    var itemTitle : String
    var dscStr    : String = ""
}

extension SectionOfCustomData: SectionModelType {
  
  typealias Item = sectionItem

   init(original: SectionOfCustomData, items: [Item]) {
    self = original
    self.items = items
  }
}
