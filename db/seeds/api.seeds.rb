begin
  if (Api.present? and not Api.exists?)
    Dotcom.active.each do |dotcom|
      dotcom.apis.each do |api|
        ApiMethod.create(api: api, name: ,
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