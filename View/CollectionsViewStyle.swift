//
//  CollectionsViewStyle.swift
//  LineFramework
//
//  Created by Abed Nayef Qasim on 9/3/19.
//  Copyright © 2019 Abed Nayef Qasim. All rights reserved.
//

import Foundation
import UIKit
public class CollectionsViewStyle {
    
    static func tableViewNoDataStyle (tableView : UITableView , isDataAvailable : Bool, displayMsg: String = ""){
        let noDataLabel: UILabel     = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width - 40 , height: tableView.bounds.size.height))
        noDataLabel.numberOfLines = 0
        noDataLabel.text             = displayMsg
        //  noDataLabel.textColor        = Helper.currentTheme.labelFontColor
        noDataLabel.font             = UIFont(name: "DINPro", size: 17)
        noDataLabel.textAlignment    = .center
        noDataLabel.textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        tableView.backgroundView = isDataAvailable ? nil : noDataLabel
    }
    
    static func collectionNoDataStyle (collectionView : UICollectionView , isDataAvailable : Bool, displayMsg: String = "",textColor: UIColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1) ){
        let noDataLabel: UILabel     = UILabel(frame: CGRect(x: 0, y: 0, width: collectionView.bounds.size.width - 40 , height: collectionView.bounds.size.height))
        noDataLabel.text             = displayMsg
        noDataLabel.numberOfLines = 0
        //  noDataLabel.textColor        = Helper.currentTheme.labelFontColor
        noDataLabel.font             = UIFont(name: "DINPro", size: 17)
        noDataLabel.textAlignment    = .center
        noDataLabel.textColor = textColor
        collectionView.backgroundView = isDataAvailable ? nil : noDataLabel
                                                                            }
}
