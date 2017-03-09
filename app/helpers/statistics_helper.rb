module StatisticsHelper

  def mttr_by_month
    stock_chart mttr_by_month_charts_path, basic_opts('Mean Time to Resolution (MTTR) by Month', 'minutes')
  end

  def mtta_by_month
    stock_chart mtta_by_month_charts_path, basic_opts('Mean Time to Acknowledge (MTTA) by Month', 'minutes')
  end

  def incident_minutes_by_month
    stock_chart incident_minutes_by_month_charts_path, basic_opts('Incident Minutes by Month', 'minutes')
  end

  def number_of_incident_by_month
    stock_chart number_of_incidents_by_month_charts_path, basic_opts('Number of Incidents by Month', 'number')
  end

  def basic_opts(title, x_axis)
    {
      library: {
        title: { text: title, x: -20 },
        yAxis:
        {
          crosshairs: true,
          title: { text: x_axis }
        },
        xAxis:
        {
          crosshair: true,
          title: { text: 'Month' },
          minRange: 30 * 24 * 3600 * 1
        },
        rangeSelector:
        {
          allButtonsEnabled: true,
          selected: 2
        },
        navigator:
        {
          enabled: false
        },
        plotOptions: {
          series: {
            connectNulls: true
          }
        },
        legend: {
          enabled: true,
          layout: 'vertical',
          align: 'right',
          verticalAlign: 'middle',
          backgroundColor: '#FFFFFF'
        }
      }
    }
  end
end
