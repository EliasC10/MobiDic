Institution.create(name: "Puch Urstein")
Institution.create(name: "Hallein")

Supervisor.create(name: "Dr. Cle", password: "test", institution_id: 1)
Supervisor.create(name: "Dr. Mens" password: "test" institution_id: 1)

Client.create(name: "Eli", date_of_birth: "01.01.2018", institution_id: 1)
Client.create(name: "As", date_of_birth: "01.01.2017", institution_id: 1)

Entry.create(text: "Spielen mit den Kindern", supervisor_id: 1)
Entry.create(text: "Waschen", supervisor_id: 2)
Entry.create(text: "Lernen alleine", supervisor_id: 1)

ClientEntry.create(client_id: 1, entry_id: 1)
ClientEntry.create(client_id: 2, entry_id: 2)
ClientEntry.create(client_id: 1, entry_id: 3)

Category.create(name: "Freizeit", flag: "#8AC65A")
Category.create(name: "Gesundheit", flag: "#8AC65A")
Category.create(name: "Bildung", flag: "#F5D22D")


EntryCategory.create(entry_id: 1 category_id: 1)
EntryCategory.create(entry_id: 2 category_id: 2)
EntryCategory.create(entry_id: 3 category_id: 3)
