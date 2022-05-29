begin
  if (Api.present? and not Api.exists?)
    Dotcom.active.each do |dotcom|
      ['public_api', 'private_api'].each do |mode|
        Api.create(dotcom: dotcom, mode: mode,
          user:     Rails.application.credentials.config[dotcom.name.to_sym][mode.to_sym][:user],
          base_url: Rails.application.credentials.config[dotcom.name.to_sym][mode.to_sym][:base_url],
          path:     Rails.application.credentials.config[dotcom.name.to_sym][mode.to_sym][:path],
          key:      Rails.application.credentials.config[dotcom.name.to_sym][mode.to_sym][:key]
          # !! Don't save secret
        )
      end
    end
    puts "===== 'Api' #{Api.count} record(s) created"
  else
    puts "===== 'Api' seeding skipped"
  end
rescue
puts "----- Achtung! Something went wrong..."
end