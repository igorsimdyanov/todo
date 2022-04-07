ActiveAdmin.register_page 'Отчет' do
  action_item :export_users do
    link_to 'Статистика', admin_otchet_report_path, method: :post
  end

  controller do
    def date_interval
      report = params[:report_form]
      return [nil, nil] unless report

      from_date = Time.local(
        report['from(1i)'].to_i,
        report['from(2i)'].to_i,
        report['from(3i)'].to_i,
        report['from(4i)'].to_i,
        report['from(5i)'].to_i,
      )
      to_date = Time.local(
        report['to(1i)'].to_i,
        report['to(2i)'].to_i,
        report['to(3i)'].to_i,
        report['to(4i)'].to_i,
        report['to(5i)'].to_i,
      )

      [from_date, to_date]
    end
  end

  page_action :report, method: :post do
    from_date, to_date = date_interval
    send_data Services::Users::Report.call(from_date, to_date),
              type: 'application/octet-stream',
              filename: 'user.xlsx'
  end

  content title: 'Пользователи' do
    render partial: 'form'
  end
end
