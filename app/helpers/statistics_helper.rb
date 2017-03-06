module StatisticsHelper

  def stat_by(start_date, end_date)
    start_date ||= 1.year.ago
    end_date ||= Time.current
    line_chart number_of_incidents_by_month_charts_path(start_date: start_date, end_date: end_date),
        basic_opts('Click count', start_date, end_date)
  end

  def mttr_by_month (start_date)
    stock_chart mttr_by_month_charts_path, library: {
        title: { text: 'MTTR by Month' },
        rangeSelector: {
        }
    }
  end

  def mtta_by_month (hash)
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

  def number_of_incident_by_month
    column_chart number_of_incidents_by_month_charts_path, library: {
        title: {text: 'Number of Incidents by Month', x: -20},
        yAxis: {
            crosshairs: true,
            title: {
                text: 'Number'
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






private

    def basic_opts(title, start_date, end_date)
    {
        discrete: true,
        library: {
        title: {text: title, x: -20},
        subtitle: {text: "from #{l(start_date, format: :medium)} to #{l(end_date, format: :medium)}", x: -20},
        yAxis: {
            title: {
            text: 'Count'
            }
        },
        tooltip: {
            valueSuffix: 'click(s)'
        },
        credits: {
            enabled: false
        }
        }
    }
    end

end