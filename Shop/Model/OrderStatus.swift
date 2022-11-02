//
//  OrderStatus.swift
//  Shop
//
//  Created by Денис Александров on 31.10.2022.
//

import Foundation
import SwiftUI

enum OrderStatus: String {
    case new = "Новый"
    case cooking = "Готовиться"
    case delivery = "Доставляется"
    case completed = "Выполнен"
    case cancel = "Отменен"
}
