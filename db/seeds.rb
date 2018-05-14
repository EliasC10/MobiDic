# frozen_string_literal: true

require 'bcrypt'

Supervisor.delete_all
Supervisor.reset_pk_sequence

Client.delete_all
Client.reset_pk_sequence

ClientEntry.delete_all
ClientEntry.reset_pk_sequence

Entry.delete_all
Entry.reset_pk_sequence

EntryCategory.delete_all
EntryCategory.reset_pk_sequence

Category.delete_all
Category.reset_pk_sequence

Institution.delete_all
Institution.reset_pk_sequence


Institution.create(name: 'Puch Urstein')
Institution.create(name: 'Hallein')

# password = BCrypt::Password.create("hunter2")

Supervisor.create(name: 'Dr. Cle', password: 'test', password_confirmation: 'test', institution_id: 1)
Supervisor.create(name: 'Dr. Mens', password: 'test', password_confirmation: 'test', institution_id: 1)
Supervisor.create(name: 'Dr. G.', password: 'test', password_confirmation: 'test', institution_id: 2)

Client.create(name: 'Elias', date_of_birth: '01.01.2005', institution_id: 1, is_female: false)
Client.create(name: 'Asef', date_of_birth: '01.03.2001', institution_id: 2, is_female: false)
Client.create(name: 'Philipp', date_of_birth: '01.09.1967', institution_id: 1, is_female: true)
Client.create(name: 'Stefan', date_of_birth: '01.07.1998', institution_id: 2, is_female: false)
Client.create(name: 'Lukas', date_of_birth: '27.03.1998', institution_id: 1, is_female: false)
Client.create(name: 'Michaela', date_of_birth: '01.12.2005', institution_id: 2, is_female: true)
Client.create(name: 'Stefanie', date_of_birth: '01.04.2011', institution_id: 1, is_female: true)
Client.create(name: 'Anna', date_of_birth: '01.02.2009', institution_id: 2, is_female: true)
Client.create(name: 'Margarethe', date_of_birth: '01.06.2005', institution_id: 1, is_female: true)
Client.create(name: 'Susanne', date_of_birth: '01.07.2002', institution_id: 2, is_female: true)

Category.create(name: 'Kognition', flag: '#F5D22D')
Category.create(name: 'Bildung', flag: '#F5D22D')
Category.create(name: 'Arbeit', flag: '#F5D22D')

Category.create(name: 'Freizeit', flag: '#8AC65A')
Category.create(name: 'Alltagsstruktur', flag: '#8AC65A')
Category.create(name: 'Gesundheit', flag: '#8AC65A')

Category.create(name: 'Sozialkontakte', flag: '#AEA4D0')
Category.create(name: 'Familie', flag: '#AEA4D0')

Category.create(name: 'Konflikte', flag: '#EF403d')
Category.create(name: 'Emotion', flag: '#EF403d')

Category.create(name: 'Sonstige', flag: '#27A9E1')
