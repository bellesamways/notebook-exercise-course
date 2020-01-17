namespace :utils do
  desc "Popular o banco de dados"
  task seed: :environment do
    10.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        kind: Kind.all.sample,
        rmk: Faker::Lorem.words(number: 2)
      )
    end

    puts 'Gerado os contatos com sucesso!'

    Contact.all.each do |contact|
      Address.create!(
        street: Faker::Address.street_address,
        city: Faker::Address.city,
        state: Faker::Address.state,
        contact: contact,
      )
    end

    puts 'Gerado os endereços com sucesso!'

    Contact.all.each do |contact|
      Phone.create!(
        phone: Faker::PhoneNumber.phone_number,
        contact: contact,
      )
    end

    puts 'Gerado os telefones com sucesso!'

  end

end
