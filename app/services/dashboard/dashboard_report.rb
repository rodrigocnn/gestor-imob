module Dashboard
  class DashboardReport
    def call
      {
        rental_portfolio: ::RentalContract.sum(:monthly_rent),
        overdue_rents: ::RentPayment.where("due_date < ? AND status = ?", Date.today, "Pendente").sum(:amount),
        received_rents: ::RentPayment.where("due_date <= ? AND status = ?", Date.today, "Pago").sum(:amount),

        total_clients: ::Client.count,
        total_owners: ::Owner.count,
        total_properties: ::Property.count,
        total_rental_contracts: ::RentalContract.count,
        total_cities: ::City.count,
        total_neighborhoods: ::Neighborhood.count,

        monthly_received_rents: monthly_received_rents
      }
    end

    def monthly_received_rents
      current_year = Date.today.year
      start_date = Date.new(current_year, 1, 1)
      end_date = Date.new(current_year, 12, 31)

      rents_by_month = ::RentPayment
        .where("payment_date >= ? AND payment_date <= ? AND status = ?", start_date, end_date, "Pago")
        .group("DATE_TRUNC('month', payment_date)")
        .sum(:amount)


      rents_by_month = rents_by_month.transform_keys { |time| time.strftime("%Y-%m") }

      months = (1..12).map { |m| Date.new(current_year, m, 1) }

      months.map do |month_date|
        key = month_date.strftime("%Y-%m")
        {
          month: month_date.strftime("%B"),
          year: month_date.year,
          amount: rents_by_month[key] || 0
        }
      end
    end
  end
end
