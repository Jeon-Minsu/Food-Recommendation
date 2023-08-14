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

    func getFilteredMenus(by checkedCategories: [MenuCategory]) -> [String] {
        if menuData.isEmpty {
            loadMenuDataFromCSV()
        }

        let excludedCategories = checkedCategories.filter { MenuCategory.spicyTaste.rawValue...MenuCategory.greasyTaste.rawValue ~= $0.rawValue }

        let includedCategories = excludedCategories.isEmpty
            ? checkedCategories
            : checkedCategories.filter { !excludedCategories.contains($0) }

        let filteredMenus = menuData.filter { menu in
            !excludedCategories.contains { menu.categories[$0] ?? false } &&
            includedCategories.allSatisfy { menu.categories[$0] ?? false }
        }.compactMap { $0.name }.shuffled()

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
            let columnHeaders: [MenuCategory] = Array(MenuCategory.allCases).filter { category in
                return category != .dummy && category != .all
            }

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
