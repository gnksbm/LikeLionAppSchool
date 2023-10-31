//
//  Sequence+.swift
//  URLImageKit
//
//  Created by gnksbm on 2023/10/06.
//

import Foundation

extension Sequence {
    func asyncForEach(
        _ operation: @escaping (Element) async -> Void
    ) async {
        await withTaskGroup(of: Void.self) { group in
            for element in self {
                group.addTask {
                    await operation(element)
                }
            }
        }
    }
}
