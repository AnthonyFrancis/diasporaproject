namespace :plans do
  desc "Setup plans"
  task :import => :environment do
    plans = Stripe::Plan.list.data
    puts "Importing #{plans.count} plans from stripe"
    plans.each do |plan|
      if plan.nickname == "One Month"
        desc = "Our Most Popular"
      elsif plan.nickname == "Three Months"
        desc = "Great Value"
      elsif plan.nickname == "Six Months"
        desc = "Best Value"
      end
      record = Plan.create(name: plan.nickname, amount: (plan.amount/100.0), description: desc,
                           stripe_id: plan.id, interval: plan.interval, interval_count: plan.interval_count)
      puts "Created plan: #{record.name} - £#{record.amount}"
    end
  end
end