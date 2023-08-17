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
        loadMenuDataIfNeeded()

        let (includedCategories, excludedCategories, mustIncludedCategories) = categorize(checkedCategories)
        let filteredMenus = filter(
            menuData,
            includedCategories: includedCategories,
            excludedCategories: excludedCategories,
            mustIncludedCategories: mustIncludedCategories
        )

        return filteredMenus
    }

    private func loadMenuDataIfNeeded() {
        if menuData.isEmpty {
            loadMenuDataFromCSV()
        }
    }

    private func categorize(_ checkedCategories: [MenuCategory]) -> (included: [MenuCategory], excluded: [MenuCategory], mustIncluded: [MenuCategory]) {
        return checkedCategories.reduce(into: ([], [], [])) { result, category in
            switch category.rawValue {
            case MenuCategory.korean.rawValue...MenuCategory.mexican.rawValue:
                result.0.append(category)
            case MenuCategory.spicyTaste.rawValue...MenuCategory.greasyTaste.rawValue:
                result.1.append(category)
            case MenuCategory.vegan.rawValue...MenuCategory.soloDining.rawValue:
                result.2.append(category)
            default:
                break
            }
        }
    }

    private func filter(_ menus: [Menu], includedCategories: [MenuCategory], excludedCategories: [MenuCategory], mustIncludedCategories: [MenuCategory]) -> [String] {
        let filteredMenus = menus.filter { menu in
            let shouldInclude = includedCategories.contains { menu.categories[$0] ?? false }
            let shouldExclude = excludedCategories.contains { menu.categories[$0] ?? false }
            let mustIncluded = mustIncludedCategories.allSatisfy { menu.categories[$0] ?? false }

            return shouldInclude && !shouldExclude && mustIncluded
        }.compactMap { $0.name }.shuffled()

        return filteredMenus
    }

    private func loadMenuDataFromCSV() {
        do {
            let data = try extractMenuDataFromFile()
            menuData = data
        } catch let error {
            handle(error)
        }
    }

    private func extractMenuDataFromFile() throws -> [Menu] {
        guard let csvURL = Bundle.main.url(forResource: "MenuData", withExtension: "csv") else {
            throw MenuDataError.fileNotFound
        }

        do {
            let menuDataCSVContent = try loadCSVContent(from: csvURL)

            return try parseMenuDataFromCSVContent(menuDataCSVContent)
        } catch {
            throw MenuDataError.loadFailure
        }
    }

    private func loadCSVContent(from url: URL) throws -> String {
        return try String(contentsOf: url, encoding: .utf8)
    }

    private func parseMenuDataFromCSVContent(_ csvContent: String) throws -> [Menu] {
        let menuDataCSVRows = csvContent.components(separatedBy: .newlines).filter { !$0.isEmpty }
        let columnHeaders = MenuCategory.allCases.filter { $0 != .dummy && $0 != .all }

        return try menuDataCSVRows.dropFirst().map { row in
            let fields = row.components(separatedBy: ",")

            guard fields.count >= 2 else {
                throw MenuDataError.invalidData
            }

            return createMenuFrom(fields, using: columnHeaders)
        }
    }

    private func createMenuFrom(_ fields: [String], using columnHeaders: [MenuCategory]) -> Menu {
        let menuName = fields[0]
        var categories: [MenuCategory: Bool] = [:]

        for (i, value) in fields.dropFirst().enumerated() {
            let boolValue = value == "O"
            let category = columnHeaders[i]
            categories[category] = boolValue
        }

        return Menu(name: menuName, categories: categories)
    }

    private func handle(_ error: Error) {
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
