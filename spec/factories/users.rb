# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :logged_user, class: User do |u|
    u.login 'Arnold'
    u.email 'info@mail.com'
    u.password '10050000'
    u.password_confirmation '10050000'
    u.confirmed_at Time.now
    u.full_name 'Ivan Petrov'
    u.birthday Time.now
    u.address 'Басейна 20'
    u.city 'Киев'
    u.state 'Киевская'
    u.country 'Украина'
    u.zip '9090'
    u.role 2
  end

end
