begin
  if (Pair.present? and not Pair.exists?)
    ### Base Currency: Euro
    base_id = Coin.find_by(code: 'EUR').id
    puts "--- Base: EUR"
    Pair.create base_id: base_id, quote_id: Coin.find_by(code: 'USD').id, code: 'EUR/USD', level: 'Major',
                decimal_places: 5, min_price: 0.5e0, max_price: 2.0, min_amount: 0.1e0,
                fee: 0.2e0, status: "active"
    Pair.create base_id: base_id, quote_id: Coin.find_by(code: 'GBP').id, code: 'EUR/GBP', level: 'Minor',
                # decimal_places: 5, min_price: 0.5e0, max_price: 2.0, min_amount: 0.1e0,
                fee: 0.2e0, status: "archived"
    Pair.create base_id: base_id, quote_id: Coin.find_by(code: 'CHF').id, code: 'EUR/CHF', level: 'Minor',
                # decimal_places: 5, min_price: 0.5e0, max_price: 2.0, min_amount: 0.1e0,
                fee: 0.2e0, status: "archived"
    Pair.create base_id: base_id, quote_id: Coin.find_by(code: 'JPY').id, code: 'EUR/JPY', level: 'Minor',
              # decimal_places: 5, min_price: 0.5e0, max_price: 2.0, min_amount: 0.1e0,
                fee: 0.2e0, status: "archived"
    Pair.create base_id: base_id, quote_id: Coin.find_by(code: 'CAD').id, code: 'EUR/CAD', level: 'Minor',
                # decimal_places: 5, min_price: 0.5e0, max_price: 2.0, min_amount: 0.1e0,
                fee: 0.2e0, status: "archived"
    Pair.create base_id: base_id, quote_id: Coin.find_by(code: 'AUD').id, code: 'EUR/AUD', level: 'Minor',
                # decimal_places: 5, min_price: 0.5e0, max_price: 2.0, min_amount: 0.1e0,
                fee: 0.2e0, status: "archived"
    Pair.create base_id: base_id, quote_id: Coin.find_by(code: 'NZD').id, code: 'EUR/NZD', level: 'Minor',
                # decimal_places: 5, min_price: 0.5e0, max_price: 2.0, min_amount: 0.1e0,
                fee: 0.2e0, status: "archived"
    Pair.create base_id: base_id, quote_id: Coin.find_by(code: 'RUB').id, code: 'EUR/RUB', level: 'Exotic',
                # decimal_places: 5, min_price: 0.5e0, max_price: 2.0, min_amount: 0.1e0,
                fee: 0.2e0

    ### Base Currency: USD
    base_id = Coin.find_by(code: 'USD').id
    puts "--- Base: USD"
    Pair.create base_id: base_id, quote_id: Coin.find_by(code: 'JPY').id, code: 'USD/JPY', level: 'Major',
                # decimal_places: 5, min_price: 0.5e0, max_price: 2.0, min_amount: 0.1e0,
                fee: 0.2e0, status: "archived"
    Pair.create base_id: base_id, quote_id: Coin.find_by(code: 'CAD').id, code: 'USD/CAD', level: 'Major',
                # decimal_places: 5, min_price: 0.5e0, max_price: 2.0, min_amount: 0.1e0,
                fee: 0.2e0, status: "archived"
    Pair.create base_id: base_id, quote_id: Coin.find_by(code: 'CHF').id, code: 'USD/CHF', level: 'Major',
                # decimal_places: 5, min_price: 0.5e0, max_price: 2.0, min_amount: 0.1e0,
                fee: 0.2e0, status: "archived"
    Pair.create base_id: base_id, quote_id: Coin.find_by(code: 'RUB').id, code: 'USD/RUB', level: 'Exotic',
                # decimal_places: 5, min_price: 0.5e0, max_price: 2.0, min_amount: 0.1e0,
                fee: 0.2e0

    ### Base Currency: GBP
    base_id = Coin.find_by(code: 'GBP').id
    puts "--- Base: GBP"
    Pair.create base_id: base_id, quote_id: Coin.find_by(code: 'USD').id, code: 'GBP/USD', level: 'Major',
                # decimal_places: 5, min_price: 0.5e0, max_price: 2.0, min_amount: 0.1e0,
                fee: 0.2e0, status: "archived"
    Pair.create base_id: base_id, quote_id: Coin.find_by(code: 'JPY').id, code: 'GBP/JPY', level: 'Minor',
                # decimal_places: 5, min_price: 0.5e0, max_price: 2.0, min_amount: 0.1e0,
                fee: 0.2e0, status: "archived"
    Pair.create base_id: base_id, quote_id: Coin.find_by(code: 'CHF').id, code: 'GBP/CHF', level: 'Minor',
                # decimal_places: 5, min_price: 0.5e0, max_price: 2.0, min_amount: 0.1e0,
                fee: 0.2e0, status: "archived"
    Pair.create base_id: base_id, quote_id: Coin.find_by(code: 'AUD').id, code: 'GBP/AUD', level: 'Minor',
                # decimal_places: 5, min_price: 0.5e0, max_price: 2.0, min_amount: 0.1e0,
                fee: 0.2e0, status: "archived"
    Pair.create base_id: base_id, quote_id: Coin.find_by(code: 'CAD').id, code: 'GBP/CAD', level: 'Minor',
                # decimal_places: 5, min_price: 0.5e0, max_price: 2.0, min_amount: 0.1e0,
                fee: 0.2e0, status: "archived"
    Pair.create base_id: base_id, quote_id: Coin.find_by(code: 'RUB').id, code: 'GBP/RUB', level: 'Exotic',
                # decimal_places: 5, min_price: 0.5e0, max_price: 2.0, min_amount: 0.1e0,
                fee: 0.2e0, status: "archived"

    ### Base Currency: AUD
    base_id = Coin.find_by(code: 'AUD').id
    puts "--- Base: AUD"
    Pair.create base_id: base_id, quote_id: Coin.find_by(code: 'USD').id, code: 'AUD/USD', level: 'Major',
                # decimal_places: 5, min_price: 0.5e0, max_price: 2.0, min_amount: 0.1e0,
                fee: 0.2e0, status: "archived"
    Pair.create base_id: base_id, quote_id: Coin.find_by(code: 'JPY').id, code: 'AUD/JPY', level: 'Minor',
                # decimal_places: 5, min_price: 0.5e0, max_price: 2.0, min_amount: 0.1e0,
                fee: 0.2e0, status: "archived"

    ### Base Currency: NZD
    base_id = Coin.find_by(code: 'NZD').id
    puts "--- Base: NZD"
    Pair.create base_id: base_id, quote_id: Coin.find_by(code: 'USD').id, code: 'NZD/USD', level: 'Major',
                # decimal_places: 5, min_price: 0.5e0, max_price: 2.0, min_amount: 0.1e0,
                fee: 0.2e0, status: "archived"
    Pair.create base_id: base_id, quote_id: Coin.find_by(code: 'JPY').id, code: 'NZD/JPY', level: 'Minor',
                # decimal_places: 5, min_price: 0.5e0, max_price: 2.0, min_amount: 0.1e0,
                fee: 0.2e0, status: "archived"

    puts "===== 'Pair' #{Pair.count} record(s) created"
  else
    puts "===== 'Pair' seeding skipped"
  end
rescue
puts "----- Achtung! Something went wrong..."
end