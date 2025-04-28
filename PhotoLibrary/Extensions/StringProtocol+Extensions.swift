//
//  StringProtocol+Extensions.swift
//  PhotoLibrary
//
//  Created by Saadet Şimşek on 27/04/2025.
//

import UIKit

//String’e hem Substring’e otomatik olarak ekleme
// Bir string içindeki tüm rakamları hızlıca bulmak
extension StringProtocol {
    var digits: [Int] { compactMap(\.wholeNumberValue)}
}
