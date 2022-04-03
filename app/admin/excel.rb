ActiveAdmin.register_page 'Excel' do
  action_item :export_users do
    link_to 'Сгенерировать', admin_excel_report_path, method: :post
  end

  page_action :report, method: :post do
    package = Axlsx::Package.new
    workbook = package.workbook

    first = workbook.add_worksheet(name: I18n.t('numbers.first').capitalize)
    first.add_row ['Value', 'Power 2']
    (-5..5).each_with_index do |val, index|
      first.add_row [val, "=POWER(A#{index + 2},2)"]
    end
    second = workbook.add_worksheet(name: I18n.t('numbers.second').capitalize)
    second.add_chart(Axlsx::BarChart, start_at: 'A6', end_at: 'F20', title: 'Power 2') do |chart|
      chart.barDir = :col
      chart.bg_color = 'FFFFFF'
      chart.add_series data: first['A2:A12'], title: first['A1'], series_color: 'FF0000'
      chart.add_series data: first['B2:B12'], title: first['B1'], series_color: '00FF00'
    end

    send_data package.to_stream.read,
              type: 'application/octet-stream',
              filename: 'book.xlsx'
  end
end
