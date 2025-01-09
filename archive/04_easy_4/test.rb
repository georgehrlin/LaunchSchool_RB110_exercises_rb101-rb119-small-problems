mailing_campaign_leads = [
  {name: 'Emma Lopez', email: 'emma.lopez@some_mail.com', days_since_login: 423, mailing_list: true},
  {name: 'mike richards', email: 'michael.richards@some_mail.com', days_since_login: 23, mailing_list: false},
  {name: 'JANE WILLIAMS', email: 'jane_w95@my_mail.com', days_since_login: 16, mailing_list: true},
  {name: 'Ash Patel', email: 'ash_patel@my_mail.com', days_since_login: 22, mailing_list: true}
]

counter = 0

loop do
  break if counter == mailing_campaign_leads.size
  full_name = mailing_campaign_leads[counter][:name] # full_name = 'Emma Lopez'
  names = full_name.split # names = ["Emma", "Lopez"]

  names_counter = 0
  loop do
    break if names_counter == names.size
    name = names[names_counter] # name = "Emma" (1) # name = "Lopez" (2)
    names[names_counter] = name.capitalize # names[names_counter] = "Emma" (1)

    names_counter += 1
  end

  capitalized_full_name = names.join(' ') # capitalized_full_name = 'Emma Lopez'
  mailing_campaign_leads[counter][:name] = capitalized_full_name

  counter += 1
end
# This first half of the code *reassigns* values associated with `:name` to
# capitalized names (first and last names)

usable_leads = []
counter = 0

loop do
  break if counter == mailing_campaign_leads.size
  last_login = mailing_campaign_leads[counter][:days_since_login] # last_login = 423
  subscribed_to_list = mailing_campaign_leads[counter][:mailing_list]
  # subscribed_to_list = true

  if last_login < 60 && subscribed_to_list
    usable_leads << mailing_campaign_leads[counter]
    # usable_leads << {name: 'JANE WILLIAMS', email: 'jane_w95@my_mail.com', days_since_login: 16, mailing_list: true}
  end

  counter += 1
end
# This second half of the code appends "leads" whose `:days_since_login` value
# is less than 60 and `:mailing_list` value is `true` to a new array
# `usable_leads`