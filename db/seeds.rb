AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

Profile.find_or_create_by(
  name: 'Charles Hudson',
  investor_type: 'Angel Investor',
  mininvest: 5000,
  maxinvest: 100000,
  website_url: 'https://precursorvc.com/team_member/charles-hudson/',
  twitter_url: 'https://twitter.com/chudson',
  angellist_url: 'https://angel.co/chudson',
  linkedin_url: 'https://www.linkedin.com/in/chudson/'
)

Profile.find_or_create_by(
  name: 'Kanyi Maqubela',
  investor_type: 'Angel Investor',
  mininvest: 5000,
  maxinvest: 100000,
  website_url: 'http://kanyi.me',
  twitter_url: 'https://twitter.com/km',
  angellist_url: 'https://angel.co/kanyi',
  linkedin_url: 'https://www.linkedin.com/in/kanyi/'
)

Profile.find_or_create_by(
  name: 'Aaron Holiday',
  investor_type: 'Angel Investor',
  mininvest: 5000,
  maxinvest: 100000,
  twitter_url: 'https://twitter.com/aholidayiii',
  angellist_url: 'https://angel.co/aaron-holiday',
  linkedin_url: 'https://www.linkedin.com/in/aholidayiii/'
)

Profile.find_or_create_by(
  name: 'Juan Scarlett',
  investor_type: 'Angel Investor',
  mininvest: 5000,
  maxinvest: 100000,
  website_url: 'https://precursorvc.com/team_member/juanscarlett/',
  angellist_url: 'https://angel.co/juan-j-scarlett',
  linkedin_url: 'https://www.linkedin.com/in/juanscarlett/'
)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?