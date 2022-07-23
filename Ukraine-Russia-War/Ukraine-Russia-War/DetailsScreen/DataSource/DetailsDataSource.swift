//
//  DetailsDataSourceItem.swift
//  Ukraine-Russia-War
//
//  Created by Chernousova Maria on 14.07.2022.
//

import UIKit

struct DetailsDataSource {
    
    typealias Source = UITableViewDiffableDataSource<Section, Item>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Item>
    
    enum Section {
        case main
    }
    
    enum Item: Hashable {
        case date(DetailsDateAdapter)
        case personnelLoss(PersonnelLoss, increase: Int?)
        case equipmentLoss(EquipmentLoss, increase: Int?)
    }
}
