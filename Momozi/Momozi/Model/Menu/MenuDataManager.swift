//
//  MenuDataManager.swift
//  Momozi
//
//  Created by 전민수 on 2023/07/31.
//

import Foundation

final class MenuDataManager {

    // MARK: Properties

    static let shared = MenuDataManager()
    private var menuData: [Menu] = []
    private enum MenuDataError: Error {
        case fileNotFound
        case invalidData
        case loadFailure
    }

    // MARK: - Initializers

    private init() {}

    // MARK: - Methods

    func getFilteredMenus(excludedCategories: [MenuCategory]) -> [String]? {
        if menuData.isEmpty {
            loadMenuDataFromCSV()
        }

        guard !excludedCategories.isEmpty else {
            return menuData.compactMap { $0.name }.shuffled()
        }

        let filteredMenus = menuData.filter { menu in
            return !excludedCategories.contains { content in
                menu.categories[content] ?? false
            }
        }.compactMap { $0.name }

        return filteredMenus
    }

    private func loadMenuDataFromCSV() {
        do {
            let csvData = try parseMenuDataFromCSV()
            menuData = csvData
        } catch let error {
            switch error {
            case MenuDataError.fileNotFound:
                print("CSV 파일을 찾을 수 없습니다.")
            case MenuDataError.invalidData:
                print("잘못된 CSV 데이터입니다.")
            case MenuDataError.loadFailure:
                print("CSV 파일을 읽어오는 데 실패했습니다.")
            default:
                print("An unexpected error occurred: \(error)")
            }
        }
    }

    private func parseMenuDataFromCSV() throws -> [Menu] {
        guard let csvURL = Bundle.main.url(forResource: "MenuData", withExtension: "csv") else {
            throw MenuDataError.fileNotFound
        }

        do {
            let csvString = try String(contentsOf: csvURL, encoding: .utf8)
            let csvLines = csvString.components(separatedBy: .newlines).filter { !$0.isEmpty }

            var menuData: [Menu] = []
            let columnHeaders: [MenuCategory] = Array(MenuCategory.allCases).dropLast()

            for (index, line) in csvLines.enumerated() {
                if index == 0 {
                    continue
                }

                let fields = line.components(separatedBy: ",")
                if fields.count >= 2 {
                    let menuName = fields[0]
                    var categories: [MenuCategory: Bool] = [:]

                    for (i, value) in fields.dropFirst().enumerated() {
                        let boolValue = value == "O"
                        let category = columnHeaders[i]
                        categories[category] = boolValue
                    }

                    let menu = Menu(name: menuName, categories: categories)
                    menuData.append(menu)
                } else {
                    throw MenuDataError.invalidData
                }
            }
            return menuData
        } catch {
            throw MenuDataError.loadFailure
        }
    }
}
