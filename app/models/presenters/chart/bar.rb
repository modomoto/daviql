module Presenters
  module Chart
    class Bar

      def initialize(query, data)
        @data = data
        @query = query
      end

      def data
        data_table = GoogleVisualr::DataTable.new

        xaxis = @data.first.to_a.first.first

        data_table.new_column('string', xaxis)

        values = []
        @data.first.to_a[1..-1].each do |element|
          values << element.first
          data_table.new_column('number', element.first)
        end

        @data.each do |d|
          a = []
          a << d[xaxis]
          values.each do |key|
            a << d[key].to_f
          end
          data_table.add_row a
          Rails.logger.info "DATA #{a}"
        end

        options = {
            title: @query.name,
            legend: { position: 'bottom', textStyle: { :fontSize => 16} },
            material: true
        }
        options[:width] = @query.width unless @query.width.blank?
        options[:height] = @query.height unless @query.height.blank?
        GoogleVisualr::Interactive::ColumnChart.new(data_table, options)
      end

    end
  end
end