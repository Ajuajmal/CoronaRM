class DashboardController < ApplicationController
  def index
    @contacts_count = Contact.all.count()
    @primary_contacts_count  = Contact.where(tracking_type: :primary).count
    @secondary_contacts_count  = Contact.where(tracking_type: :secondary).count

    @number_of_contacts_contacted_today = Contact.joins(:calls).where(calls:{created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day}).count
    @number_of_primary_contacted_today = Contact.joins(:calls).where(tracking_type: :primary,calls:{created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day}).count
    @number_of_secondary_contacted_today = Contact.joins(:calls).where(tracking_type: :secondary, calls:{created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day}).count
  end

  def generate_csv_report
    @contacts = Contact.all()
    respond_to do |format|
      format.html
      format.csv { send_data @contacts.to_csv, filename: "users-#{Date.today}.csv" }
    end
  end
end