//
//  ListCountryViewController.swift
//  ArkCovid
//
//  Created by irem TOSUN on 7.06.2022.
//

import Foundation
import os.log
import RxCocoa
import RxSwift
import UIKit

public struct TableViewCell {
    public static let cellReuseIdentifier = "CovidReuseId"
    public static let cellNibIdentifier = "CovidTableViewCell"
}

class ListCountryViewController: BaseViewController {
    private var disposeBag = DisposeBag()
    @IBOutlet var countryNameTextField: UITextField!
    @IBOutlet var countryCasesTableView: UITableView!

    var viewModel: HomeViewModel!

    let cellRowHeight = 160

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Countries"
        navigationItem.setHidesBackButton(true, animated: false)

        viewModel = HomeViewModel()

        addSearchBarObserver()

        bindTableData()
    }

    private func bindTableData() {
        let nib = UINib(nibName: TableViewCell.cellNibIdentifier, bundle: nil)
        countryCasesTableView.register(nib, forCellReuseIdentifier: TableViewCell.cellReuseIdentifier)

        viewModel.listItems
            .bind(to: countryCasesTableView.rx.items(cellIdentifier: TableViewCell.cellReuseIdentifier, cellType: CovidTableViewCell.self)) { _, model, cell in
                cell.viewModel = model
            }
            .disposed(by: disposeBag)
       
        // MARK: For navigating to details

        countryCasesTableView.rx.modelSelected(CountryCellViewModel.self).bind { [weak self] country in
            let view = CountryDetailsViewController.loadFromNib()
            view.model = country
            self?.navigationController?.pushViewController(view, animated: true)

        }.disposed(by: disposeBag)
    }

    private func addSearchBarObserver() {
        countryNameTextField
            .rx
            .text
            .orEmpty
            .debounce(.milliseconds(100), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .subscribe { [weak self] query in
                guard
                    let query = query.element else { return }
                self?.viewModel.searchText.accept(query)
            }
            .disposed(by: disposeBag)
    }
}
