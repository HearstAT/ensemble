class ChartsController < ApplicationController
before_action :authenticate_user!

  def mttr_by_month
    bu_array = Array.new
    PagerDutyConfig.all.each do |pd|
      result = PagerDutyIncident.where(business_unit_id: pd.business_unit_id).group_by_month(:created_on).average(:seconds_to_resolve)
      result.each_pair do |key,value|
        result[key] = value.to_i/60
      end
      bu_array << {name: pd.business_unit.name, data: result}
    end
    render json: bu_array
  end

  def mtta_by_month
    bu_array = Array.new
    PagerDutyConfig.all.each do |pd|
      result = PagerDutyIncident.where(business_unit_id: pd.business_unit_id).group_by_month(:created_on).average(:seconds_to_first_ack)
      result.each_pair do |key,value|
        result[key] = value.to_i/60
      end
      bu_array << {name: pd.business_unit.name, data: result}
    end
    render json: bu_array
  end

  def incident_minutes_by_month
    bu_array = Array.new
    PagerDutyConfig.all.each do |pd|
      result = PagerDutyIncident.where(business_unit_id: pd.business_unit_id).group_by_month(:created_on).sum(:seconds_to_resolve)
      result.each_pair do |key,value|
        result[key] = value.to_i/60
      end
      bu_array << {name: pd.business_unit.name, data: result}
    end
    render json: bu_array
  end

  def number_of_incidents_by_month
    bu_array = Array.new
    PagerDutyConfig.all.each do |pd|
      result = PagerDutyIncident.where(business_unit_id: pd.business_unit_id).group_by_month(:created_on).count
      bu_array << {name: pd.business_unit.name, data: result}
    end
    render json: bu_array
  end
end
