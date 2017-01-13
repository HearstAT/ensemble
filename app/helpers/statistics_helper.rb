module StatisticsHelper

  def mttr_by_month
    line_chart mttr_by_month_charts_path, library: {
        title: {text: 'MTTR by Month', x: -20},
        yAxis: {
            crosshairs: true,
            title: {
                text: 'Minutes'
            }
        },
        xAxis: {
            crosshair: true,
            title: {
                text: 'Month'
            }
        }
    }
  end

  def mtta_by_month
    line_chart mtta_by_month_charts_path, library: {
        title: {text: 'MTTA by Month', x: -20},
        yAxis: {
            crosshairs: true,
            title: {
                text: 'Minutes'
            }
        },
        xAxis: {
            crosshair: true,
            title: {
                text: 'Month'
            }
        }
    }
  end

  def incident_minutes_by_month
    line_chart incident_minutes_by_month_charts_path, library: {
        title: {text: 'Incident Minutes by Month', x: -20},
        yAxis: {
            crosshairs: true,
            title: {
                text: 'Minutes'
            }
        },
        xAxis: {
            crosshair: true,
            title: {
                text: 'Month'
            }
        }
    }
  end

end