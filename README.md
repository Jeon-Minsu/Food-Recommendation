# Momozi

## 프로젝트 저장소
> 프로젝트 기간: 2023-07-12 ~ 2023-09-04</br>
> 팀원: iOS Developer 1명(전민수), Desinger 1명(전현정)

## 📑 목차
- [프로젝트 소개](#프로젝트-소개)
- [키노트 pdf](#키노트-pdf)
- [Prototype](#Prototype)
- [구현화면](#구현화면)
- [주요기능설명](#주요기능설명)
- [TroubleShooting](#TroubleShooting)

## 프로젝트 소개

<img src="https://github.com/Jeon-Minsu/Momozi/assets/99063327/3ce1db25-60af-4fb2-9946-e1b133d277ba" width="100" height="100">

### 뭐 먹지? 고민될 땐, 모모찌!

● 편식쟁이도 아무거나도 만족할 수 있도록!
- 수백개의 메뉴 데이터 베이스에서 조건에 맞춘 추천
- 한식부터 멕시칸까지, 비건부터 혼밥러까지 다양한 음식 필터링
- 맵찔이 디자이너가 고집해 만든 확실한 매운 음식 필터링까지

● 마음에 드는 메뉴가 나올 때까지 스와이프
- 추천 메뉴가 마음에 안들 땐 왼쪽으로 가볍게 스와이프
- 설정한 조건 내에서 마음에 드는 메뉴가 나올 때까지 메뉴 추천
- 그래도 끝까지 마음에 드는 메뉴가 안나온다면… 모모찌 눈물..

● 너무 심플하네요.. 하지만 귀엽죠?
- ‘모찌리도후’ 라는 일본의 디저트에서 영감을 얻어 태어난 모모찌
- 활기찬 모모찌와 늘 현명한 결정을 도와주는 와사비상
- 귀여운 모모찌와 함께 메뉴 결정 시간에 소소한 즐거움을 얻어보세요


### Skill
- `Xcode`, `Swift`,
- `UIKit`, `MVC`
- `Figma`
- `Cocoapods`, `Koloda`

### Target Version
![](https://img.shields.io/badge/iOS-14.0-informational) 

## 키노트 pdf
- [프로젝트 진행하면서 작성한 키노트](https://github.com/Jeon-Minsu/Momozi/wiki/Keynote-PDF)

## ProtoType
![Prototype](https://github.com/Jeon-Minsu/Momozi/assets/99063327/4cc8b8da-2ca1-40ec-b887-93b47863b203)

## 구현화면
|로딩화면|설정화면|
|:---:|:---:|
| <img src = "https://github.com/Jeon-Minsu/Momozi/assets/99063327/2e669813-14bc-4ed5-869a-d5e2d817cf6c" width="300" height="600">| <img src = "https://github.com/Jeon-Minsu/Momozi/assets/99063327/889d0be8-04c4-4bed-a264-94818c23565f" width="300" height="600"> |

|메뉴추천화면|메뉴결과화면|
|:---:|:---:|
| <img src = "https://github.com/Jeon-Minsu/Momozi/assets/99063327/8db05c70-a989-4aaa-9042-96f1b0c19b07" width="300" height="600">| <img src = "https://github.com/Jeon-Minsu/Momozi/assets/99063327/fb2364fb-621c-42cb-bc63-52a6c3490980" width="300" height="600"> |


## 주요기능설명

### 음식 카테고리 설정에 따른 메뉴 추천

<img src = "https://github.com/Jeon-Minsu/Momozi/assets/99063327/063c5153-38f3-4bf7-a241-5fbb5fed8dfb" width="300" height="600">

- 한식부터 아무거나(모든 항목)에 이르기까지 추천 받기 항목의 아이템(셀)을 선택하여 선호하는 음식 카테고리 설정
- 매운맛부터 느끼함에 이르기까지 추천 안받기 항목의 아이템(셀)을 선택하여 비선호하는 맛 설정
- 비건 및 혼밥 여부 설정
- 추천 받기 버튼 클릭시, 앱 내부에 저장된 400여개의 음식 데이터를 사용자 선택 카테고리에 따라 필터링하여 메뉴 추천 화면으로 전달
- Card-Swipe 방식을 통해 음식 메뉴가 마음에 들지 않으면 left swipe -> 새로운 메뉴 추천
- 음식 메뉴가 마음에 들면 right swipe -> 메뉴 결과 화면으로 이동


## 🚀TroubleShooting
### UI: 그라데이션 배경색과 패턴 이미지 함께 넣기
#### 문제상황
- 그라데이션 배경색과 패턴 이미지를 동시에 적용하자 문제 발생
- 패턴 이미지를 설정한 후, CALayer를 통해 배경색을 추가했지만 미작동

#### 해결방법
- 그라데이션 배경색은 UIView의 CALayer의 colors 프로퍼티에, 패턴 이미지는 UIView의 contents 프로퍼티에 할당됨
- 순서를 바꾸어 그라데이션 배경색을 먼저 설정하고, 그 다음 패턴 이미지를 CALayer의 contents 속성으로 추가하면 두 가지  요소가 함께 동작
  - 배경색 설정
    - CALayer의 배경 색상 정의
    - 레이어의 배경을 채우는 역할
  - 이미지 설정 
    - Contents 프로퍼티를 통해 CALayer에 추가
    - 이미지를 레이어의 콘텐츠로 표시
- 순서를 역전시키면, 이미지가 배경 위에 놓이게 되어, 배경 안 보임
- UIView의 구조에 대하여 이해하고, 특히, CALayer 작동 방식을 깊이 고찰하는 계기

------------------

### Memory: 메모리 할당 및 해제 타이밍 문제
#### 문제상황1
- 홈 버튼 클릭시, 메뉴 추천 화면에서 설정 화면으로 돌아오는 과정에서, 패턴 이미지가 사라지는데 딜레이 존재
- 메모리 누수 관련 디버깅 결과에는 문제를 발견하지 못함

#### 해결방법1
- UINavigationController를 사용하여 다른 뷰 컨트롤러로 전환하는 경우, 뷰 컨트롤러가 스택에서 제거되는 시점과 연관된 문제
- 패턴 이미지가 적절하게 해제되지 않는 것으로 보이므로, UINavigationController에서 뷰 컨트롤러를 pop하기 전에 subview를 removeFromSuperview를 호출함으로써 문제 해결

#### 문제상황2
- 메뉴 추천 화면의 카드 contentView에 그라데이션 배경을 적용하고자함
- 레이어 프레임 설정 시점이 카드 뷰의 프레임이 계산되기 전에 발생하여 위치를 잡지 못함

#### 해결방법2
- 문제를 해결하기 위해 뷰의 프레임이 이미 계산된 후에 그라데이션 레이어를 추가
- viewDidLayoutSubviews() 메서드를 활용하여 그라데이션 레이어의 프레임 업데이트
- 해당 메서드는 뷰의 레이아웃이 업데이트 되기 때문

#### 공통점
- UIViewController의 life cycle과 Memory Allocation에서 비롯된 문제
- 뷰 컨트롤러의 생명 주기에 따라 메모리 할당 및 해제를 관리하여 앱의 성능과 안정성 향상을 도모해야함
- 뷰 컨트롤러는 앱 화면 전환 시에 중요한 역할 -> 화면 전환으로 뷰 컨트롤러가 생성되거나 해제
- 이때 메모리 누수를 방지하려면 객체를 생성 및 해제하는 시점을 신중하게 관리
- 나아가, 뷰 컨트롤러 내에서 subView 및 Layer와 같은 리소스를 동적으로 생성할 때, 이들은 뷰 컨트롤러의 생명 주기와 일치하도록 해야함
- 생성한 리소스는 해당 뷰 컨트롤러가 활성화되는동안 유지되어야 하며, 뷰 컨트롤러가 해제되는 시점에 메모리에서 정확하게 해제되어야 함
- 올바른 메모리 관리는 앱의 성능 향상과 충돌 및 오류 예방에 기여
- 뷰 컨트롤러의 생명 주기와 메모리 관리를 함께 고려하면 앱이 안정하게 실행되며 사용자 경험 향상 기대

------------------

### DB: 메뉴 데이터 저장 위치 고민
#### 문제상황
- 400여개에 달하는 메뉴 데이터를 불러오는 방법에  고민
  - Local DB 장단점
    - 내부 데이터로 저장시, 네트워킹 없이 데이터 접근 가능
    - 서버 유지 비용, 사용자의 네트워킹 비용 최소화
    - 모델 데이터 업데이트 필요시, 재배포 필요
    - 모델 데이터 크기에 따라 앱의 크기 비례
  - Remote DB 장단점
    - 원격 서버 사용시, 업데이트 및 관리 용이
    - 클라이언트 앱의 크기 작게 유지 가능
    - 인터넷 연결 필요
    - 네트워킹 지연 가능성 존재
    - 서버 유지 비용 존재

#### 해결방법
- 다음의 판단 기준을 통해 결정
  - 모델 데이터 크기
  - 필요 업데이트 빈도
  - 앱의 목적

- 메뉴 400개의 데이터는 상대적으로 작은 크기
- 메뉴 데이터의 경우 업데이트 빈도가 적은편
- 앱 데이터를 내부에 저장함으로써 안정적으로 사용 가능
- Remote 저장소를 사용하는 것보다, 더 단순하고 간편하며 빠른 처리 가능
- 이를 종합하여 Remote 보다는 Local에 저장하는 것이 더욱 합리적이라 판단
- 앱 내부 파일 시스템을 통해, CSV 파일을 앱의 내부 저장소에 포함
- 앱 번들에 포함되어 있는 CSV 파일을, 앱 내부 저장소로 복사하여 사용
- 데이터가 번들에 포함되어 독립적으로 동작하며, 오프라인 상태에서도 데이터 사용 가능
- 데이터 업데이트 필요시, 새로운 CSV 파일로 교체하여 앱 업데이트가 필요하지만, 추후 앱 버전 체크 기능을 추가해 사용자의 불편을 줄이고자 노력할 것

------------------

### Logic: 전체 선택/취소 버튼 액션 구현
#### 문제상황
![일괄 선택 및 취소](https://github.com/Jeon-Minsu/Momozi/assets/99063327/21109160-2756-4d67-bab1-f7e8a71ff013)

- 사용자가 아무거나(all) 버튼을 토글할 때, 모든 다른 추천 받기 항목 자동 토글 필요
- 뿐만 아니라, 개별 항목을 다시 토글하여, 모든 메뉴가 선택된 것이 아닐때도 아무거나 버튼도 자동 토글 필요

#### 해결방법
```swift
extension SettingsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let selectedCell = collectionView.cellForItem(at: indexPath) as? SettingsCell else {
            return
        }

        selectedCell.toggleUI()

        let selectedCategory = selectedCell.extractCategoryOfCell()

        if selectedCategory == .all {
            let isAllButtonSelected = selectedCell.settingsCellDidToggle()
            toggleCategoriesBasedOnAllButtonState(isAllButtonSelected, in: collectionView)
        } else {
            manageCheckedCategoriesFrom(selectedCell)
            updateAllButtonState(in: collectionView)
        }
    }

    private func toggleCategoriesBasedOnAllButtonState(_ isAllButtonSelected: Bool, in collectionView: UICollectionView) {
        for category in MenuCategory.korean.rawValue...MenuCategory.mexican.rawValue {
            if let categoryCell = collectionView.cellForItem(at: IndexPath(row: category, section: 0)) as? SettingsCell {
                if isAllButtonSelected != categoryCell.settingsCellDidToggle() {
                    categoryCell.toggleUI()
                    manageCheckedCategoriesFrom(categoryCell)
                }
            }
        }
    }

    private func updateAllButtonState(in collectionView: UICollectionView) {
        guard let allButtonCell = collectionView.cellForItem(at: IndexPath(
            row: MenuCategory.all.rawValue,
            section: 0)
        ) as? SettingsCell else {
            return
        }

        if isAllCategoriesSelected() != allButtonCell.settingsCellDidToggle() {
            allButtonCell.toggleUI()
        }
    }

    private func isAllCategoriesSelected() -> Bool {
        for category in MenuCategory.korean.rawValue...MenuCategory.mexican.rawValue {
            if let currentCategory = MenuCategory(rawValue: category),
                !checkedCategories.contains(currentCategory) {
                return false
            }
        }
        return true
    }

    private func manageCheckedCategoriesFrom(_ cell: SettingsCell) {
        let categoryOfCurrentCell = cell.extractCategoryOfCell()

        if cell.settingsCellDidToggle() {
            checkedCategories.append(categoryOfCurrentCell)
        } else {
            if let index = checkedCategories.firstIndex(of: categoryOfCurrentCell) {
                checkedCategories.remove(at: index)
            }
        }
    }
}
```

- 사용자가 컬렉션 뷰의 아이템을 선택했을 때, `collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)` 메서드 호출
- 선택된 셀이 `SettingsCell` 클래스의 인스턴스인지 확인한 후, 그렇지 않으면 메서드를 종료
- 선택된 셀의 UI를 토글하기 위해 `selectedCell.toggleUI()`를 호출
- 선택된 셀로부터 해당 셀이 속한 카테고리를 추출
- 만약 선택된 카테고리가 "all"이라면, `selectedCell.settingsCellDidToggle()`를 호출하여 현재 all 버튼의 상태를 확인하고, 이에 따라 다른 모든 항목의 버튼을 토글하는 `toggleCategoriesBasedOnAllButtonState` 메서드를 호출
- "all"이 아닌 경우, 선택된 카테고리의 상태를 관리하고, 모든 카테고리가 선택되었는지 확인하여 all 버튼의 상태를 업데이트하는 `manageCheckedCategoriesFrom` 및 `updateAllButtonState` 메서드를 호출
- `isAllCategoriesSelected` 메서드는 모든 카테고리가 선택되었는지 확인하기 위해 사용
- `manageCheckedCategoriesFrom` 메서드는 선택된 카테고리를 관리하며, 해당 카테고리가 선택되었는지 또는 선택이 해제되었는지에 따라 작업을 수행

- 이를 통해, 사용자가 다양한 조건에 따라 컬렉션 뷰의 항목을 선택하고 토글하는 복잡한 상황을 처리
- 또한 "all" 버튼의 상태를 변경하고, 모든 항목이 선택되었을 때 자동으로 all 버튼을 토글하는 등의 상황을 처리
- 이렇게 다양한 예외 상황을 고려함으로써, 안정적이고 사용자 친화적인 인터페이스를 제공하고자 노력


------------------

### Logic: 메뉴 데이터 필터링 로직 고민
#### 문제상황
- 기존 필터링 로직은 선택된 카테고리에 해당하는 메뉴를 추천하는 방식으로 동작
- 그러나 알러지 항목의 대체로 인하여 추천 받기 항목, 추천 안받기 항목, 비건 항목, 혼밥 항목으로 나뉜 상황
- 추천 받기의 경우에 해당 카테고리가 선택되었다면 이를 하나라도 만족하는 메뉴 필터링 필요
- 추천 안받기 항목의 경우에는 해당 카테고리가 선택되었다면 이를 제외한 메뉴 필터링 필요
- 비건 & 혼밥의 경우는 해당 카테고리를 반드시 만족하는 메뉴 필터링 필요

#### 해결방법

- 먼저 사용자가 상호작용한 카테고리는 모두 선택된 카테고리 형태로 입력받음
- 이에 관하여, 범주화(categorize) 작업 진행
  - 포함해야할(or) 카테고리: 한식 ~ 멕시칸
  - 제외해야할 카테고리: 매운맛 ~ 느끼함
  - 반드시 포함해야할(and) 카테고리: 비건, 혼밥
- 다음으로 필터링 작업 진행
  - 포함해야할 카테고리는 contains가 true일 때 메뉴 추천
  - 제외해야할 카테고리는 contains가 false일 때 메뉴 추천 
  - 반드시 포함해야할 카테고리는 allSatisfy가 true일 때 메뉴 추천
- 이를 통해, 사용자의 복잡한 선택에도 대응하여 메뉴 추천이 가능해짐
- 코드와 같이 살펴보면 다음과 같음

```swift
final class MenuDataManager {
    ...
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
    ...
}
```
- `getFilteredMenus` 메서드는 사용자가 선택한 카테고리를 받아서 해당 카테고리를 기반으로 메뉴를 필터링하여 추천
- 메뉴 데이터를 필요한 경우 CSV 파일에서 로드하는 `loadMenuDataIfNeeded` 메서드 호출
- `categorize` 메서드는 선택한 카테고리를 범주화하여 포함해야할 카테고리, 제외해야할 카테고리, 반드시 포함해야할 카테고리로 분류
- `filter` 메서드는 메뉴 데이터를 받아서 포함해야할 카테고리를 포함하고, 제외해야할 카테고리를 제외하며, 반드시 포함해야할 카테고리를 모두 만족하는 메뉴를 추출
- 최종적으로 추천된 메뉴의 이름을 반환
